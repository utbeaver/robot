#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
from parautility import *
import actuator_solve as asol
import warnings
from numpy import linalg as LA
import numpy as np
import matplotlib



warnings.filterwarnings('error')
np.set_printoptions(precision=4, linewidth=200)
class RobotDrawingBoard(glcanvas.GLCanvas):
    def __init__(self, parent, mainWin):
        glcanvas.GLCanvas.__init__(self, parent, -1, style=wx.WANTS_CHARS)
        self.mainW=mainWin
        self.mat_s=[]
        self.mats=[]
        self.init = False
        # initial mouse position
        self.lastx = self.x = 0
        self.lasty = self.y = 0
        self.size = None
        self.CtrlPanel=None
        self.Bind(wx.EVT_ERASE_BACKGROUND, self.OnEraseBackground)
        self.Bind(wx.EVT_SIZE, self.OnSize)
        self.Bind(wx.EVT_PAINT, self.OnPaint)
        self.Bind(wx.EVT_LEFT_DOWN, self.OnMouseDown)
        self.Bind(wx.EVT_LEFT_UP, self.OnMouseUp)
        self.Bind(wx.EVT_MOTION, self.OnMouseMotion)
        self.Bind(wx.EVT_MOUSEWHEEL, self.OnMouseWheel)
        self.Bind(wx.EVT_KEY_DOWN, self.onKeyPress)
        self.Bind(wx.EVT_KEY_UP, self.onKeyPressUp)
        self.trace=[]
        self.time=0.0
        self.minx=-20
        self.maxx=50
        self.miny=-40
        self.maxy=50
        self.minz=-50
        self.maxz=50
        self.keychar=None
        b=179.712872402
        a=110.287188795
        #self.rangle=[180.0, 175.2952, 175.2952, 180.0, 175.2952]
        #self.langle=[b, 95.7399, 95.7399, b, 95.7399]
	#self.drs=[-120, -60, -60, -120, -60 ]
	#self.dls=[120, 110, 120, 120, 120 ]
	self.drs=[120, 90, 90, 120, 90 ]
	self.dls=[120, 134.48, 134.48, 120, 134.48 ]
        self.rangle=[180, b, b, 180, b]
        self.langle=[180, a, a, 180, a]

        self.disps=[(-self.drs[i]+self.dls[i])/2 for i in range(5)]	

        self.sliderVal=[]
	for i in range(8): self.sliderVal.append(0)
	alpha=(45,45,-45,45,0)
	for i in range(5): self.sliderVal.append(alpha[i])
	shift=(120*0, 55,55,55,55,120*0,55,55)
	for i in range(8): self.sliderVal.append(shift[i])
	self.ProcessInput(self.disps, self.dls, self.drs, self.rangle, self.langle)
	self.endX=None
        self.variables=None
	self.theta=[0 for i in range(8)]
        self.drawed=0
        self.reset=1
        self.Jac=np.zeros((11,11))
        self.Rhs=np.zeros((11,1))
        self.det=-1.0

    def setCPanel(self, pan):
        self.CtrlPanel=pan

    def OnTrace(self, evt):
        self.trace=[]
        evt.Skip()    

    def OnReset(self, evt):
        if self.reset==1:
            self.reset=0
        else:
            self.reset=1
        evt.Skip()    

    def ProcessInput(self, disps, dls, drs, ra, la):
        for i in range(5):
            self.disps[i]=disps[i]

        vals=[]
	for k in  range(len(disps)):
	    val=disps[k]
	    if k in [1,2,4]:
		b=la[k]
		a=ra[k]
                delta=dls[k]-drs[k] 
		a1_=a12(val)*180.0/np.pi
                a1=a-a1_
                val1=val-delta
		a3_=a34(val1)*180/np.pi
                a3=b-a3_
            if k in [0,3]:
                vals.append(val)
            elif k in [1,2,4]:
                vals.append(a1)
                vals.append(a3)
            else:    
                vals.append(val)
        for i in range(len(vals)):
            self.sliderVal[i]=vals[i]

    def setTime(self, t):
        self.time=t
   
    def onKeyPress(self, evt):
        keycode=evt.GetKeyCode()
        if keycode<256:
            char = chr(keycode).lower()
            if char=='x' or char=='y' or char=='z': 
                self.keychar=char
        else:
            char=keycode
            if char==wx.WXK_UP or char==wx.WXK_DOWN or char==wx.WXK_LEFT or char==wx.WXK_RIGHT or char==wx.WXK_HOME:
                self.keychar=char
                self.ViewControl()  
                self.Refresh()
                self.Update()
        evt.Skip()
        
    def onKeyPressUp(self, evt):
        self.keychar=None
        
    def OnEraseBackground(self, event):
        pass # Do nothing, to avoid flashing on MSW.

    def OnSize(self, event):
        wx.CallAfter(self.DoSetViewport)
        event.Skip()
        
    def DoSetViewport(self):
        if self.IsShown():
            size = self.size = self.GetClientSize()
            self.SetCurrent()
            glViewport(0, 0, size.width, size.height)
        
    def OnPaint(self, event):
        if self.drawed==1:
            self.drawed=0
            return
        self.drawed=1
#        dc = wx.PaintDC(self)
        self.SetCurrent()
        if not self.init:
            self.InitGL()
            self.init = True
        self.OnDraw()
        self.SwapBuffers()
        event.Skip()
#
    def OnMouseDown(self, evt):
        #self.CaptureMouse()
        self.x, self.y = self.lastx, self.lasty = evt.GetPosition()
        evt.Skip()

    def OnMouseUp(self, evt):
        self.lastx, self.lasty = self.x, self.y
        #self.ReleaseMouse()
        evt.Skip()

    def OnMouseMotion(self, evt):
        if evt.Dragging() and evt.LeftIsDown():
            self.lastx, self.lasty = self.x, self.y
            self.x, self.y = evt.GetPosition()
            self.Refresh(False)
        evt.Skip()    


    def OnMouseWheel(self, evt):    
        rot=evt.GetWheelRotation()
        self.pn=rot/120
        dx=0.5
        dy=0.5
        if self.keychar==None:     
            self.minx=self.minx-dx*self.pn
            self.maxx=self.maxx+dx*self.pn
            self.miny=self.miny-dy*self.pn
            self.maxy=self.maxy+dy*self.pn
        self.ViewControl()  
        self.Refresh()
        self.Update()
        evt.Skip()

    def ViewControl(self):
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        disp=-0.5
        if self.keychar==wx.WXK_UP:
            self.miny=self.miny+disp
            self.maxy=self.maxy+disp
        elif self.keychar==wx.WXK_DOWN:  
            self.miny=self.miny-disp
            self.maxy=self.maxy-disp            
        elif self.keychar==wx.WXK_LEFT:
            self.minx=self.minx-disp
            self.maxx=self.maxx-disp            
        elif self.keychar==wx.WXK_RIGHT:
            self.minx=self.minx+disp
            self.maxx=self.maxx+disp                  
        glOrtho(self.minx, self.maxx, self.miny, self.maxy, self.minz, self.maxz) 
        glMatrixMode(GL_MODELVIEW)
        if self.keychar == 'x' or self.keychar == 'y'  or self.keychar == 'z':            
            prem=glGetFloat(GL_MODELVIEW_MATRIX)
            glLoadIdentity()
            delta=-5
            if self.keychar=='x':
                glRotate(delta*self.pn, 1,0,0)
            elif  self.keychar=='y':  
                glRotate(delta*self.pn, 0,1,0)
            else:
                glRotate(delta*self.pn, 0,0,1)
            glMultMatrixf(prem)   
        elif self.keychar==wx.WXK_HOME:
            glMatrixMode(GL_MODELVIEW)
            glLoadIdentity()
            glRotate(-90, 1,0,0)
               
    def InitGL(self):
        # set viewing projection
        self.ViewControl()
        #glMatrixMode(GL_PROJECTION)
        glMatrixMode(GL_MODELVIEW)
        glRotate(-90, 1,0,0)
        glEnable(GL_DEPTH_TEST)
        glEnable(GL_LIGHTING)
        glEnable(GL_LIGHT0)
        glEnable (GL_COLOR_MATERIAL )
        glEnable(GL_NORMALIZE)
        glLightModelfv(GL_LIGHT_MODEL_AMBIENT, [0.8, 0.8, 0.8, 1.0])
        glLightfv(GL_LIGHT0, GL_DIFFUSE, [0.5, 0.5, 0.5, 1.0])
        glLightfv(GL_LIGHT0, GL_POSITION, [0,0, 10])
        
        self.axes=glGenLists(1)
        glNewList(self.axes, GL_COMPILE)
        glBegin(GL_LINES)
        glColor3f(1.0, 1.0, 1.0)
        glVertex3f(0,0,0)
        glVertex3f(5,0,0)
        glColor3f(0.0,1.0,0.0)
        glVertex3f(0,0,0)
        glVertex3f(0,5,0)
        glColor3f(0.0, 0.0, 1.0)
        glVertex3f(0,0,0)
        glVertex3f(0,0,5)
        glEnd() 
        glEndList()
	self.OnDraw()
#        
    def OnDraw(self):
        d2r=np.pi/180.0
        if self.reset==1:
	    for i in range(8):
                self.theta[i]=self.sliderVal[i]*d2r
    
    	    self.alpha1=self.sliderVal[8]*d2r
    	    self.alpha2=self.sliderVal[9]*d2r
	    self.alpha3=self.sliderVal[10]*d2r
	    self.alpha4=self.sliderVal[11]*d2r
	    self.alpha5=self.sliderVal[12]*d2r

	    self.shift0=self.sliderVal[13]*d2r
	    self.shift1=self.sliderVal[14]*d2r
	    self.shift2=self.sliderVal[15]*d2r
	    self.shift3=self.sliderVal[16]*d2r
	    self.shift4=self.sliderVal[17]*d2r
	    self.shift5=self.sliderVal[18]*d2r
	    self.shift6=self.sliderVal[19]*d2r
	    self.shift7=self.sliderVal[20]*d2r
        self.variables=np.asmatrix([self.theta[0], 
		self.theta[1], self.theta[2], self.theta[3], self.theta[4], 
		self.rangle[1]*d2r-self.theta[1], self.langle[1]*d2r-self.theta[2], 
		self.rangle[2]*d2r-self.theta[3], self.langle[2]*d2r-self.theta[4], 
		self.disps[1]/100.0, self.disps[2]/100.0]).T
        self.predict(self.variables) 
        self.Rhs_Jac(np.array([0,0,0]))
        self.DrawMechanism()
        pos_=self.mats[-1][:3,3]
        str_="x=%9.5f,  y=%9.5f, z=%9.5f, disp1=%7.4f, disp2=%7.4f, det=%5.2f"%(pos_[0], pos_[1], pos_[2], self.variables[9], self.variables[10], self.det)
        self.mainW.SetStatusText(str_)
        ws_info=np.array([pos_[0], pos_[1], pos_[2], self.variables[9], self.variables[10], self.det])
        return ws_info

    def DrawMechanism(self): 
        d2r=np.pi/180.0
        # clear color and depth buffers
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glPushMatrix()
        glCallList(self.axes)
        
        dh_m0=DenHarMat((self.theta[0]-self.shift0), 0.0, 0, 0)
        glPushMatrix()
        glMultMatrixf(dh_m0.flatten('F'))
        glTranslate(0, 0, -0.999)
        DrawPrism(2.5, 2.5, 1, color=(1,1,1))
        glPopMatrix()

        Mcon=[]
	#cm=glGetFloatv(GL_MODELVIEW_MATRIX) 
	for x in [-1, 1]:
	    for y in [-1, 1]:
                glPushMatrix()
                glPushMatrix()
                dh_m1a=DenHarMat(0, 90.0*d2r, x, y)
		dh_m1a=np.dot(dh_m0, dh_m1a)

                glPushMatrix()
        	glMultMatrixf(dh_m1a.flatten('F'))
                connector(0.4, 0.4, 0.5, 0.4, (1,1,1))
                glPopMatrix()

                level_base1=np.copy(dh_m1a)
                dh_m1a, level_base1a, toNext=CreateDelta(dh_m1a, level_base1, self.alpha1, x, y, 0, 1)
                dh_m1t=DenHarMat((self.theta[1]-self.shift1), 0, 0, 0)
		dh_m1=np.dot(dh_m1a, dh_m1t)
                #link1(5.0, 0.4, 0.4, dh_m1, (1,0,0))
                link1(self.l1, 0.4, 0.4, dh_m1, (1,0,0))
		if toNext is not None:
		    toNext=ParallelTo(toNext, dh_m1)
                    link1(self.l1, 0.4, 0.4, toNext, (1,0,0))

		dh_m2a=DhmAlong(dh_m1, np.array([self.l1,0,0,1]))
		level_base2=ParallelTo(dh_m2a, level_base1a)
                dh_m2a, level_base2a, toNext=CreateDelta(dh_m2a, level_base2, self.alpha2, x, y, 1)

                dh_m2t=DenHarMat((self.theta[2]-self.shift2), 0.0*d2r, 0, 0)
                dh_m2=np.dot(dh_m2a, dh_m2t)
                link1(self.l2, 0.4, 0.4, dh_m2, (0,1,1))
		if toNext is not None:
		    toNext=ParallelTo(toNext, dh_m2)
                    link1(self.l2, 0.4, 0.4, toNext, (1,0,0))
#	
		dh_m3a=DhmAlong(dh_m2, np.array([self.l2,0,0,1]))
		level_base3=ParallelTo(dh_m3a, level_base2a)    
                dh_m3a, level_base3a, toNext=CreateDelta(dh_m3a, level_base3, self.alpha3, x, y, 0)
                dh_m3t=DenHarMat((self.theta[3]-self.shift3), 0.0*d2r, 0, 0)
                dh_m3=np.dot(dh_m3a, dh_m3t)
                link1(self.l3, 0.4, 0.4, dh_m3, (1,0,1))
		if toNext is not None:
		    toNext=ParallelTo(toNext, dh_m3)
                    link1(self.l3, 0.4, 0.4, toNext, (1,0,0))
#
		dh_m4a=DhmAlong(dh_m3, np.array([self.l3,0,0,1]))
		level_base4=ParallelTo(dh_m4a, level_base3a)    
                dh_m4a, level_base4a, toNext=CreateDelta(dh_m4a, level_base4, self.alpha4, x, y, 1)
#
       	        dh_m4=DenHarMat((self.theta[4]-self.shift4), 0.0, 0.0, 0.0)
                dh_m4=np.dot(dh_m4a, dh_m4)
                link1(self.l4, 0.4, 0.4, dh_m4, (1,0,1))
		if toNext is not None:
		    toNext=ParallelTo(toNext, dh_m4)
                    link1(self.l4, 0.4, 0.4, toNext, (1,0,0))

		dh_m5a=DhmAlong(dh_m4, np.array([self.l4,0,0,1]))
                level_base5= ParallelTo(dh_m5a, level_base4a)
                dh_m5l, level_base5a, toNext=CreateDelta(dh_m5a, level_base5, self.alpha5, x, y, 0)

		ref=np.copy(dh_m5l)
		ref[0,3]=ref[0,3]-x*0
		ref[1,3]=ref[1,3]-y*0
		Mcon.append(ref)
                glPopMatrix()
                glPopMatrix()

	#cm=glGetFloatv(GL_MODELVIEW_MATRIX) 
	pos=Mcon[0][:,3]
	pos=pos+Mcon[1][:,3]
	pos=pos+Mcon[2][:,3]
	pos=pos+Mcon[3][:,3]
	pos=pos/4.0
        dh_m5a=Mcon[1]
	dh_m5a[:,3]=pos
	dh_m5b=DenHarMat(0, -90*d2r, 1, 0)
	dh_m5a=np.dot(dh_m5a, dh_m5b)
   	glPushMatrix()
        glMultMatrixf(dh_m5a.flatten('F')) 
	glRotate(-90, 0, 0, 1)
        connector(2.0, 0.8, 1.0, 2.0) 
	glPopMatrix()

	dh_m5=DenHarMat((self.theta[5]-self.shift5), 0, 0, 0)
	dh_m5=np.dot(dh_m5a, dh_m5)
   	glPushMatrix()
        glMultMatrixf(dh_m5.flatten('F')) 
   	glPushMatrix()
	glRotate(90, 0, 0, 1)
        connector(2.0, 0.8, 1.0, 2.0) 
	glPopMatrix()
    	glTranslatef(2,0, 0)
	glRotate(-90, 0, 0, 1)
	glRotate(-90, 0, 1, 0)
        connector(2.0, 0.8, 1.0, 2.0) 
	glPopMatrix()

	dh_m6=DenHarMat((self.theta[6]-self.shift6), 90*d2r, 2, 0)
	dh_m6=np.dot(dh_m5, dh_m6)
        link1(2.0, 0.4, 0.4, dh_m6, (1,0,1))

	dh_m7=DenHarMat((self.theta[7]-self.shift7),0,2,0)
	dh_m7=np.dot(dh_m6, dh_m7)
        link1(1.0, 0.4, 0.4, dh_m7, (1,0,1))
        glPopMatrix()

        end1=dh_m7#np.dot(dh_m0, dh_m7)
        end2=DhmAlong(end1, (1,0,0,1))
        self.trace.append((end1[0:3, 3], end2[0:3,3]))
        glPushAttrib(GL_COLOR_BUFFER_BIT)
        glColor3fv([1,1,0])
        self.DrawLines()
        glPopAttrib()
        return 0

    def predict(self, vec=None):
	if vec is not None:    
	    for i in range(5):
	        self.theta[i]=vec[i,0]	
            self.disps[1]=vec[9,0]*100    
            self.disps[2]=vec[10,0]*100    
        self.mats=[]
        d2r=np.pi/180.0
        dh_m0=DenHarMat((self.theta[0]-self.shift0), 0.0*d2r, 1, 0)
        self.mats.append(dh_m0)   #0
        dh_m1a=DenHarMat(0*d2r, 90.0*d2r, 0, 0)
	dh_m1a=np.dot(dh_m0, dh_m1a)
        self.mats.append(dh_m1a)   #1
        dh_m1b=np.dot(dh_m1a,DenHarMat((90*d2r-self.alpha1)))  
        level1=np.copy(dh_m1b)
        #dh_m1c=np.dot(dh_m1b,DenHarMat(-self.shift1))  

        self.l1=5.0
        m_link1=DenHarMat((self.theta[1]-self.shift1), 0, 0)
        m_link1=np.dot(dh_m1b, m_link1)
        m_link1=MoveLocal(m_link1, (self.l1, 0,0,1))
        self.mats.append(m_link1)  #2

        self.l2=5.0*3#np.sqrt(2.0)/2
        level2=np.dot(level1, DenHarMat(-self.alpha2))
        dh_m2c=np.dot(m_link1, DenHarMat(-self.shift2))  
        m_link2=DenHarMat(self.theta[2])
        m_link2=np.dot(dh_m2c, m_link2)
        m_link2=MoveLocal(m_link2, (self.l2, 0,0,1))
        self.mats.append(m_link2)  #3

        dh_m3a=ParallelTo(m_link2, level2)
        dh_m3b=MoveLocal(dh_m3a, np.array([0, 2, 0, 1]))
        self.mats.append(dh_m3b)  #4
        dh_m3c=np.dot(dh_m3b, DenHarMat((0-self.alpha3), 0, 0, 0))
        dh_m3c=MoveLocal(dh_m3c, np.array([0, -2, 0, 1]))
        level3=np.copy(dh_m3c)
        dh_m3c=np.dot(dh_m3c, DenHarMat(-self.shift3))  
        self.mats.append(dh_m3c)  #5

        self.l3=5.0
        m_link3=np.dot(dh_m3c, DenHarMat(self.theta[3],0,0))
        m_link3=MoveLocal(m_link3, (self.l3, 0,0,1))
        self.mats.append(m_link3)  #6
        self.l4=5.0*2.5
        level4=np.dot(level3, DenHarMat(-self.alpha4))
        dh_m4c=np.dot(m_link3, DenHarMat(-self.shift4))  
        m_link4=np.dot(dh_m4c, DenHarMat(self.theta[4], 0, 0))
        m_link4=MoveLocal(m_link4, (self.l4, 0,0,1))
        self.mats.append(m_link4) #7
        dh_m5a=ParallelTo(m_link4, level4)
        dh_m5a=MoveLocal(dh_m5a, (0, 1, 0, 1))
        self.mats.append(np.copy(dh_m5a))  #8
        dh_m5a=MoveLocal(dh_m5a, (1, 0, 0, 1))
        self.mats.append(np.copy(dh_m5a))  #9

        m_link5=np.dot(dh_m5a, DenHarMat(0, -90*d2r, 0, 0))
        m_link5=np.dot(m_link5, DenHarMat((self.theta[5]-self.shift5), 0, 0, 0))

        self.endVector(m_link5, self.mats) 

    def DrawLines(self):
        glBegin(GL_LINE_STRIP)
        for i in self.mats:
            glVertex3fv(i[0:3,3])
        glEnd()
        glBegin(GL_LINE_STRIP)
        for v in self.mat_s:
            glVertex3fv(v)
        glEnd()
	#self.trace=[]
        glBegin(GL_POINTS)
        #glBegin(GL_LINES)
        for it in self.trace:
            glVertex3fv(it[0])
            #glVertex3fv(it[1])
        glEnd()			


    def endVector(self, m_link5, mats_=[]):
	d2r=np.pi/180.0
        m_link5=MoveLocal(m_link5, (2, 0,0,1))
        mats_.append(m_link5) #10
        m_link6=np.dot(m_link5, DenHarMat((self.theta[6]-self.shift6), 90*d2r, 0, 0))
        m_link6=MoveLocal(m_link6, (2, 0,0,1))
        mats_.append(m_link6) #11
        m_link7=np.dot(m_link6, DenHarMat((self.theta[7]-self.shift7), 0*d2r, 0, 0))
        m_link7=MoveLocal(m_link7, (1, 0,0,1))
        mats_.append(m_link7)  #12
        return mats_

    def endAngles(self, endMat, nosolv=0): 
	d2r=np.pi/180.0
	#get theta_z and theta_z for the end-effector
	thetazb=np.arctan2(endMat[0,2], -endMat[1,2])#+self.shift5
	thetaze=np.arctan2(endMat[2,0], endMat[2,1])
        if nosolv==1:
            return [0.0, thetaze, thetazb]

        thetazb=thetazb+self.shift5
        thetaze= thetaze+self.shift6+self.shift7
	#get the two angles of last actuator  
        _endX=np.asmatrix(np.array([self.theta[6], self.theta[7], self.disps[4]/100.0])).T
        _endX=np.asmatrix(np.array([90*d2r, 90*d2r, -0.06*0])).T
	_endX=asol.solver(_endX, thetaze/d2r, self.dls[4]/100.0, 
            self.drs[4]/100.0, self.rangle[4], self.langle[4])
        return [_endX, thetaze, thetazb]

    def Rhs_Jac(self, TraPos):
        R=1.0
	d2r=np.pi/180.0
        self.Rhs[:3,0]=self.mats[9][:3,3]-TraPos
	dh_m0=self.mats[0]
        m_link4=self.mats[9]
        self.Jac[:3,0]=np.cross(dh_m0[:3, 2], m_link4[:3,3]-dh_m0[:3,3]) 
	dh_m1=self.mats[1]
	m_link2=self.mats[3]
        self.Jac[:3,1]=np.cross(dh_m1[:3, 2], m_link2[:3,3]-dh_m1[:3,3]) 
	dh_m2=self.mats[2]
	m_link2=self.mats[3]
        self.Jac[:3,2]=np.cross(dh_m2[:3, 2], m_link2[:3,3]-dh_m2[:3,3]) 
	dh_m3=self.mats[5]
	m_link4=self.mats[7]
        self.Jac[:3,3]=np.cross(dh_m3[:3, 2], m_link4[:3,3]-dh_m3[:3,3]) 
	dh_m4=self.mats[6]
        self.Jac[:3,4]=np.cross(dh_m4[:3, 2], m_link4[:3,3]-dh_m4[:3,3]) 
        self.Rhs[3,0]=self.variables[1,0]-(self.rangle[1]*d2r-self.variables[5,0])
        self.Rhs[4,0]=self.variables[2,0]-(self.langle[1]*d2r-self.variables[6,0])
        self.Rhs[5,0]=self.variables[3,0]-(self.rangle[2]*d2r-self.variables[7,0])
        self.Rhs[6,0]=self.variables[4,0]-(self.langle[2]*d2r-self.variables[8,0])
        for i in range(4):
            self.Jac[3+i,1+i]=1.0
            self.Jac[3+i,5+i]=1.0
            
        disp=self.variables[9,0]
        l11=np.sqrt(R*R+disp*disp)
        h11=np.sqrt(max(0.0, R*R-l11*l11/4.0))
        self.Rhs[7,0]=np.cos(self.variables[5,0])-0.5*disp/R+h11/l11
        self.Jac[7,5]=-np.sin(self.variables[5,0])
        self.Jac[7,9]=-0.5-R*R*disp/(l11*l11*l11*h11)
    
        disp=disp-(self.dls[1]-self.drs[1])/100.0
        l12=np.sqrt(R*R+disp*disp)
        h12=np.sqrt(max(0.0, R*R-l12*l12/4.0))
        self.Rhs[8,0]=np.cos(self.variables[6,0])-0.5*disp/R-h12/l12
        self.Jac[8,6]=-np.sin(self.variables[6,0])
        self.Jac[8,9]=-0.5+R*R*disp/(l12*l12*l12*h12)
    
        disp=self.variables[10,0]
        l21=np.sqrt(R*R+disp*disp)
        h21=np.sqrt(max(0.0, R*R-l21*l21/4.0))
        self.Rhs[9,0]=np.cos(self.variables[7,0])-0.5*disp/R+h21/l21
        self.Jac[9,7]=-np.sin(self.variables[7,0])
        self.Jac[9,10]=-0.5-R*R*disp/(l21*l21*l21*h21)

        disp=disp-(self.dls[2]-self.drs[2])/100.0
        l22=np.sqrt(R*R+disp*disp)
        h22=np.sqrt(max(0.0, R*R-l22*l22/4.0))
        self.Rhs[10,0]=np.cos(self.variables[8,0])-0.5*disp/R-h22/l22
        self.Jac[10,8]=-np.sin(self.variables[8,0])
        self.Jac[10,10]=-0.5+R*R*disp/(l22*l22*l22*h22)
	J=np.asmatrix(self.Jac) 
        Jp1=J[:3, 1:3]*J[7:9,5:7].I*J[7:9,9]
        Jp2=J[:3, 3:5]*J[9:11, 7:9].I*J[9:11,10]
        te= np.hstack((Jp1, Jp2))[::2,:]
        self.det= te[0,0]*te[1,1]-te[1,0]*te[0,1]
        
        return J

    def solveIKs(self, endMats):
	endMat=endMats[-1]    
        R=1.0
	d2r=np.pi/180.0
        self.endX, thetaze, thetazb=self.endAngles(endMat)
        #calculate mat9  to tip of end-effector  
	dh_m5=DenHarMat(thetazb-self.shift5, 0, 0, 0)
        theta6=self.rangle[4]*d2r-self.endX[0,0]
        self.endX, thetaze, thetazb=self.endAngles(endMat)
        theta7=self.langle[4]*d2r-self.endX[1,0]
        self.theta[6]=theta6
        self.theta[7]=theta7
        dh_mats=self.endVector(dh_m5)

        dh_m7b=dh_mats[-1]
        pos=endMat[0:3, 3] 
        endVec=dh_m7b[:3,3]
        TraPos=pos-endVec
        theta0=np.arctan2(TraPos[1], TraPos[0])#+self.shift0
	#projection on zero plane
	vec=np.array([np.sqrt(TraPos[0]*TraPos[0]+TraPos[1]*TraPos[1]), 0, TraPos[2]])
        
    def solveIK(self, endMats, iter_=1, idx=0):
	endMat=endMats[-1]    
        R=1.0
	d2r=np.pi/180.0

        self.endX, thetaze, thetazb=self.endAngles(endMat)
        #calculate mat9  to tip of end-effector  
	dh_m5=DenHarMat(thetazb-self.shift5, 0, 0, 0)
        theta6=self.rangle[4]*d2r-self.endX[0,0]
        self.endX, thetaze, thetazb=self.endAngles(endMat)
        theta7=self.langle[4]*d2r-self.endX[1,0]
        self.theta[6]=theta6
        self.theta[7]=theta7
        dh_mats=self.endVector(dh_m5)

        dh_m7b=dh_mats[-1]
        pos=endMat[0:3, 3] 
        endVec=dh_m7b[:3,3]
        TraPos=pos-endVec
        #initial value for first joint
        theta0=np.arctan2(TraPos[1], TraPos[0])+self.shift0
        self.variables=np.asmatrix([self.theta[0]+0*d2r, 
		self.theta[1]+d2r*20*0, self.theta[2]-20*d2r*0, self.theta[3]-15*d2r*0, self.theta[4]+15*d2r*0, 
		self.rangle[1]*d2r-self.theta[1], self.langle[1]*d2r-self.theta[2], 
		self.rangle[2]*d2r-self.theta[3], self.langle[2]*d2r-self.theta[4], 
		self.disps[1]/100.0, self.disps[2]/100.0]).T
    	maxrhs=1.0
    	maxdelta=1.0
	ii=0
        oldDx=None
        oleDet=None
        while((maxrhs>1.0e-4 or maxdelta>1.0e-4) and ii<iter_):
	    self.predict(self.variables)	
            pos_=self.mats[-1][:3,3]
            J=self.Rhs_Jac(TraPos)
            #print J
            if ii>0:
                if self.det*oldDet<0:
		    print self.variables[9:11].T , oldDx.T	
	            self.variables=self.variables+oldDx-oldDx/2.0
                    oldDx=oldDx/2.0
                    if np.max(np.abs(oldDx))<1.0e-5: return 1
                    print 30*"y"
                    continue


	    dX=J.getI()*self.Rhs
            ratios=[]
            for i in range(2):
                dx=dX[i+9,0]
                oriX=self.variables[i+9,0]
                dl=self.dls[i+1]/100.0
                dr=self.drs[i+1]/100.0
                scale=asol.scaleDX(oriX, dx, dl, dr)
                ratios.append(scale)
            scale=min(ratios)    
            dX=dX*scale
	    self.variables=self.variables-dX
            self.theta[5]=thetazb-self.shift5-(self.variables[0]-self.shift0)+self.shift5
            maxrhs=np.max(np.abs(dX))
            maxdelta= np.max(np.abs(self.Rhs))
	    m_link4=self.mats[7]
            str_="x=%9.5f,  y=%9.5f, z=%9.5f, disp1=%7.4f, disp2=%7.4f, det=%5.2f, scale=%5.3f"%(pos_[0], pos_[1], pos_[2], self.variables[9], self.variables[10], self.det, scale)
            #print "%2d, %s"%(ii, str_)
            oldDet=self.det
            oldDx=dX
	    ii=ii+1	
	self.variables=self.variables+dX
        self.disps[1]=self.variables[9]*100     
        self.disps[2]=self.variables[10]*100     
        self.theta[5]=thetazb-self.shift5-(self.theta[0]-self.shift0)+self.shift5
        self.CtrlPanel.updateSlider(self.disps)
            
        if ii<iter_:
            self.mainW.SetStatusText(str_)
        if ii==iter_:    
            print str_
            print endMat
            print self.Rhs
            return 1
        return 0

    def saveWorkspace(self, ws_attrs):
        pf=open("det.dat", "w")
        for vs in ws_attrs:
            pf.write("%9.5f %9.5f %9.5f %9.5f %9.5f %9.5f\n"%(vs[0], vs[1], vs[2], vs[3], vs[4], vs[5]))
        pf.close()    

    def toNewPosition(self, target, n=10):
        d2r=np.pi/180.0
        self.predict(vec=None)
        source=self.mats[-1]
        temp, thezet, thezbt=self.endAngles(target, 1)
        temp, thezes, thezbs=self.endAngles(source, 1)
        post=target[:3,3]
        poss=source[:3,3]
        for i in range(n):
            pos=poss+(post-poss)/(n-1.0)*i
            theze=thezes+(thezet-thezes)/(n-1.0)*i
            thezb=thezbs+(thezbt-thezbs)/(n-1.0)*i
            c1=np.cos(thezb)
            s1=np.sin(thezb)
            c2=np.cos(theze)
            s2=np.sin(theze)
            mat=np.array([
                [c1*c2,  -s2*c1,  s1, pos[0]],
                [s1*s2,  -s1*s2, -c1, pos[1]],
                [s2,      c2,     0.0,pos[2]],
                [0,0,0,1]
                ])
            #print mat[:3,3].T, i
            status=self.solveIK([mat], 20)
            self.DrawMechanism()
            self.SwapBuffers()
            if status!=0: 
                #print target, i
                return 1

        return status


    def SaddleFollowing(self):
        L=4
        scale=0.1
        dx=25
        dz=18
        Ry=np.array([[0,0,1], [0,1,0], [-1, 0, 0]]) #RY -90 deg
        R=np.zeros((4,4))
        self.mat_s=[]
        R[3,3]=1.0
        flip=1
	first=1
        sca=4.0
        for xval in np.linspace(-L*1.5, L*1.5,  10):  
            if  flip==1:
                yidx= np.linspace(-L*sca, L*sca, 10)
                flip=0
            else:    
                yidx= np.linspace(L*sca, -L*sca, 10)
                flip=1
            for yval in yidx:  
                z, nor_=saddle(xval, yval, scale)
                pos_=np.array([xval, yval, z])
                temp=np.dot(Ry, pos_)
                pos=temp+np.array([dx, 0, dz])
                nx=np.dot(Ry, nor_)
                nz=np.cross(nx, np.array([0,0,1]))
                ny=np.cross(nz, nx)
                R[:3,0]=nx
                l=np.sqrt(np.dot(ny, ny))
                R[:3,1]=ny/l
                R[:3,2]=nz/np.sqrt(np.dot(nz, nz))
                R[:3,3]=pos
                self.mat_s.append(pos)
		if first==1:
			#print R
                	status=self.toNewPosition(R, 2)
                        if status!=0: return 
			#first=0
                #print pos
        
        if flip==0:
            yidx= np.linspace(L*sca, -L*sca, 10)
        else:    
            yidx= np.linspace(-L*sca, L*sca, 10)
        flip=1    
        for yval in yidx:    
            if flip==1:
                xidx=np.linspace(L*1.5, -L*1.5, 10)
                flip=0
            else:    
                xidx=np.linspace(-L*1.5, L*1.5, 10)
                flip=1
            for xval in xidx:#np.linspace(L*1.5, -L*1.5, 10):
                z, nor_=saddle(xval, yval, scale)
                pos_=np.array([xval, yval, z])
                temp=np.dot(Ry, pos_)
                pos=temp+np.array([dx, 0, dz])
                nx=np.dot(Ry, nor_)
                nz=np.cross(nx, np.array([0,0,1]))
                ny=np.cross(nz, nx)
                R[:3,0]=nx
                l=np.sqrt(np.dot(ny, ny))
                R[:3,1]=ny/l
                R[:3,2]=nz/np.sqrt(np.dot(nz, nz))
                R[:3,3]=pos
                self.mat_s.append(pos)
                status=self.toNewPosition(R, 2)
                if status!=0: return 
    
        

class ControlPanel(wx.Panel):
    def __init__(self, parent, model):
        wx.Panel.__init__(self, parent, id=-1)
        self.dict={}
        self.model=model
        self.SetBackgroundColour("white")
        box = wx.BoxSizer(wx.VERTICAL)
	txt=wx.StaticText(self, -1, "joints")			
        box.Add(txt, 1, wx.EXPAND)
        disps=model.disps
        for i in range(5):
	    dr=model.drs[i]	
	    dl=model.dls[i]	
            slider=wx.Slider(self, -1, disps[i], -dr, dl, name="joint %d"%i, style= wx.SL_HORIZONTAL |  wx.SL_LABELS)
            self.dict[i]=slider
            box.Add(slider, 1, wx.EXPAND)
	txt=wx.StaticText(self, -1, "Alpha")			
        box.Add(txt, 1, wx.EXPAND)
	alpha=model.sliderVal[8:13]
        for i in range(5):
            slider=wx.Slider(self, -1, alpha[i], -90, 90, name="Adjusting Angle", style= wx.SL_HORIZONTAL | wx.SL_LABELS)
            self.dict[5+i]=slider
            box.Add(slider, 1, wx.EXPAND)
	txt=wx.StaticText(self, -1, "Shift")			
        box.Add(txt, 1, wx.EXPAND)
	shift=model.sliderVal[13:]
        for i in range(8):
            b=90
            if i in [0,5]: b=125
            slider=wx.Slider(self, -1, shift[i], -b, b, name="Shift Angle", style= wx.SL_HORIZONTAL | wx.SL_LABELS)
            self.dict[10+i]=slider
            box.Add(slider, 1, wx.EXPAND)
        self.Bind(wx.EVT_SLIDER, self.sliderUpdate)    
        self.SetAutoLayout(True)
        self.SetSizer(box)
        self.Layout()
        
    def updateSlider(self, disps):    
        for i in range(len(disps)):
            if disps[i] is None: continue
            self.dict[i].SetValue(int(disps[i]))

    def sliderUpdate(self, evt=None):
	disp=[]
	dls=[]
	drs=[]
        for k in self.dict.keys():
	    v=self.dict[k]
            val=v.GetValue()
	    if k in range(5): self.model.disps[k]=val
            minv=v.GetMin()
            maxv=v.GetMax()
            disp.append(val)
            dls.append(maxv)
            drs.append(-minv)
        self.model.ProcessInput(disp, dls, drs, self.model.rangle, self.model.langle)
        self.model.reset=1
        ws_info=self.model.OnDraw()     
        self.model.reset=0
        self.model.SwapBuffers()
        if evt is not None:
            evt.Skip()
        return ws_info    

    def OnFollowSaddle(self, evt=None):
        self.model.SaddleFollowing()
        if evt is not None:
            evt.Skip()

    def OnWorkspace(self, evt=None):
        self.SetEvtHandlerEnabled(False)
        self.model.trace=[]
        slider0=self.dict[0]
        mind=slider0.GetMin()
        maxd=slider0.GetMax()
        num1=60
        num2=4
        ws_attrs=np.array([num1, num2, 0.0, 0.0, 0.0, 0.0])

        for val0 in [0]:# np.linspace(mind, maxd, 3):
            slider0.SetValue(val0)
            slider1=self.dict[1]
            mind=slider1.GetMin()
            maxd=slider1.GetMax()
	    for val1 in np.linspace(mind, maxd, num1):
                slider1.SetValue(val1)
                slider2=self.dict[2]
                mind=slider2.GetMin()
                maxd=slider2.GetMax()
                #maxd=20+12.0/11.0*val1
                maxd=val1
		for val2 in np.linspace(mind, maxd, num2):
                    slider2.SetValue(val2)
                    ws_info=self.sliderUpdate()
                    ws_attrs=np.vstack((ws_attrs, ws_info))
                    #slider3=self.dict[3]
                    #mind=slider3.GetMin()
                    #maxd=slider3.GetMax()
		    #for val3 in np.linspace(mind, maxd, 6):
                    #    slider3.SetValue(val3)
                    #    slider4=self.dict[4]
                    #    mind=slider4.GetMin()
                    #    maxd=slider4.GetMax()
		#	for val4 in np.linspace(mind, maxd, 6):
                #            slider4.SetValue(val4)
                #            self.sliderUpdate()
                #glFlush()
        #self.model.saveWorkspace()        
        self.calculateWsBoundary(ws_attrs, num1, num2)
        self.SetEvtHandlerEnabled(True)
        if evt is not None:
            evt.Skip()
        return     

    def calculateWsBoundary(self, ws_attrs, num1=20, num2=5):
        idx=[0]
        for i in range(num2):
            for j in range(num1):
                id_=i+j*num2+1
                idx.append(id_)
        ws=ws_attrs[idx, :]        
        pf=open("det.dat", "w")
        for vs in ws:
            pf.write("%9.5f %9.5f %9.5f %9.5f %9.5f %9.5f\n"%(vs[0], vs[1], vs[2], vs[3], vs[4], vs[5]))
        pf.close()    


    def OnTraverse1(self, evt=None):
        num=50;
        disps=[]
        for i in range(5):
            disp=np.linspace(self.dict[i].GetMin(), self.dict[i].GetMax(), num)
            disps.append(disp)
        self.SetEvtHandlerEnabled(False)
        self.model.trace=[]
        for i in range(num):
            for j in range(5):
                self.dict[j].SetValue(disps[j][i])
            self.sliderUpdate()
            glFlush()
        self.SetEvtHandlerEnabled(True)
        if evt is not None:
            evt.Skip()

    def OnTraverse2(self, evt=None):
        num=50
        disps=[]
        for i in range(5):
            disp=np.linspace(self.dict[i].GetMin(), self.dict[i].GetMax(), num)
            disps.append(disp)
        self.SetEvtHandlerEnabled(False)
        self.model.trace=[]
        for i in range(5):
            for j in range(num):
                self.dict[i].SetValue(disps[i][j])
                self.sliderUpdate()
                glFlush()
        self.SetEvtHandlerEnabled(True)
        if evt is not None:
            evt.Skip()

class MainWindow(wx.Frame):
    def __init__(self, parent = None, id = -1, title = "Syringa Robotics Inc."):
        # Init
        wx.Frame.__init__(
                self, parent, id, title, size = (1000,800),
                style = wx.DEFAULT_FRAME_STYLE #| wx.NO_FULL_REPAINT_ON_RESIZE
        )
        glutInit()
        self.time_=0.0
        self.split = wx.SplitterWindow(self, -1, style = wx.SP_LIVE_UPDATE)
        #box = wx.BoxSizer(wx.HORIZONTAL)
        self.robot=RobotDrawingBoard(self.split, self)
        self.left=ControlPanel(self.split, self.robot)
        self.robot.setCPanel(self.left)
        self.split.SetMinimumPaneSize(5)
        self.split.SplitVertically(self.left, self.robot, -100)
        self.split.SetSashPosition(200)
        self.split.SetSashPosition(200)
        box = wx.BoxSizer(wx.HORIZONTAL)
        box.Add(self.split, 1, wx.ALIGN_CENTRE|wx.ALL|wx.EXPAND, 5)
        self.SetSizer(box)

 
        self.SetAutoLayout(True)
        #self.SetSizer(box)
        self.Layout()

        # StatusBar
        self.CreateStatusBar()

        # Filemenu
        filemenu = wx.Menu()

        # Filemenu - Exit
        menuitem = filemenu.Append(wx.ID_EXIT, "E&xit", "Terminate the program")
        self.Bind(wx.EVT_MENU, self.OnExit, id=wx.ID_EXIT) # here comes the event-handler

        #Simu Menu
        simmenu = wx.Menu()
        self.trace_id=wx.NewId()
        self.reset_id=wx.NewId()
        self.ws_id=wx.NewId()
        self.traverse1_id=wx.NewId()
        self.traverse2_id=wx.NewId()
        self.saddle_id=wx.NewId()
        menuitem = simmenu.Append(self.trace_id, "Trace(on/off)", "enable/disable tracing")
        self.Bind(wx.EVT_MENU, self.OnTrace, id=self.trace_id) # here comes the event-handler

        menuitem = simmenu.Append(self.reset_id, "Reset(on/off)", "enable/disable Reset")
        self.Bind(wx.EVT_MENU, self.OnReset, id=self.reset_id) # here comes the event-handler

        menuitem = simmenu.Append(self.ws_id, "Workspace", "Workspace ")
        self.Bind(wx.EVT_MENU, self.OnWorkspace, id=self.ws_id) # here comes the event-handler

        menuitem = simmenu.Append(self.traverse1_id, "Traverse1", "Traverse ")
        self.Bind(wx.EVT_MENU, self.OnTraverse1, id=self.traverse1_id) # here comes the event-handler

        menuitem = simmenu.Append(self.traverse2_id, "Traverse2", "Traverse ")
        self.Bind(wx.EVT_MENU, self.OnTraverse2, id=self.traverse2_id) # here comes the event-handler

        menuitem = simmenu.Append(self.saddle_id, "Saddle Following", "Saddle ")
        self.Bind(wx.EVT_MENU, self.OnFollowSaddle, id=self.saddle_id) # here comes the event-handler

        # Menubar
        menubar = wx.MenuBar()
        menubar.Append(filemenu,"&File")
        menubar.Append(simmenu,"&Sim")
        self.SetMenuBar(menubar)
        self.timer = wx.Timer(self)
        self.SetStatusText("Started!")

        self.Show(True)
        self.trace=0


    def OnExit(self,evt):
        if self.trace==0:
            self.Close(True)  # Close the frame.
            self.trace=1
        else:
            self.trace=0
        evt.Skip()

    def OnTrace(self, evt):    
        if self.trace==0:
            self.robot.OnTrace(evt) 
            self.trace=1
        else:
            self.trace=0
        evt.Skip()
 
    def OnReset(self, evt):    
        if self.trace==0:
            self.robot.OnReset(evt) 
            self.trace=1
        else:
            self.trace=0
        evt.Skip()

    def OnFollowSaddle(self, evt):
        if self.trace==0:
            self.left.OnFollowSaddle(evt) 
            self.trace=1
        else:
            self.trace=0
        evt.Skip()
        #sys.exit(0)

    def OnWorkspace(self, evt):    
        if self.trace==0:
            self.left.OnWorkspace(evt) 
            self.trace=1
        else:
            self.trace=0
        evt.Skip()

    def OnTraverse1(self, evt):        
        if self.trace==0:
            self.left.OnTraverse1(evt) 
            self.trace=1
        else:
            self.trace=0
        evt.Skip()
 
    def OnTraverse2(self, evt):        
        if self.trace==0:
            self.left.OnTraverse2(evt) 
            self.trace=1
        else:
            self.trace=0
        evt.Skip()
 
if __name__=="__main__":        
    app = wx.PySimpleApp()
    frame = MainWindow()
    app.MainLoop()

# destroying the objects, so that this script works more than once in IDLEdieses Beispiel
    del frame
    del app
