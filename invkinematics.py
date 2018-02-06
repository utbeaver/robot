import numpy as np
import matplotlib
from OpenGL.GL import *
from wx import *

d2r=np.pi/180.0
r2d=1.0/d2r



class Marker:
    def __init__(self, _name="baseM", _pos=np.matrix([[0.0,0.0,0.0]]).T, _prev=None):
        self.name=_name
        self.pos=_pos
        self.prevM=_prev
        self.Rot=np.matrix([[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]])
        self.dh=np.matrix([[0.0, 0.0, 0.0, 0.0], 
                           [0.0, 0.0, 0.0, 0.0], 
                           [0.0, 0.0, 0.0, 0.0], 
                           [0.0, 0.0, 0.0, 1.0]])
        self.P=self.pos

    def update(self, _m):
        if self.prevM!=None:
            self.Rot=self.prevM.Rot*_m
            self.P=self.prevM.Rot*self.pos+self.prevM.P
            self.dh[:3, :3]=self.Rot
            self.dh[:3, 3]=self.P

    def DH(self):
        return self.dh
  
        

class Joint:
    def __init__(self, _name, _J, val=0):
        self.name=_name
        self.Jm=_J
        self.Im=Marker(self.name+"Im", np.matrix([[0.0,0.0,0.0]]).T, self.Jm)
        self.val=val
        self.rotz=np.matrix([[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]) 

    def update(self, a):
        c=np.cos(a)
        s=np.sin(a)
        self.rotz[2,2]=1.0
        self.rotz[0,0]=c
        self.rotz[0,1]=-s
        self.rotz[1,1]=c
        self.rotz[1,0]=s
        self.Im.update(self.rotz)

    def IM(self): return self.Im
#    def JM(self): return self.J        



class Link:
    def __init__(self, _name, paras, I=None, color=(1,1,1)):
        self.name=_name
        self.color=color
        self.m=1.0
        self.scale=0.5#
        self.Im=I
        self.d=paras[0]
        self.a=paras[1]
        self.alpha=paras[2]
        self.r=paras[3]
        c=np.cos(self.alpha)
        s=np.sin(self.alpha)
        self.rotx=np.matrix([[1.0, 0.0, 0.0], [0.0, c, -s], [0.0, s, c]]) 
        self.Jm=Marker(self.name+"_"+"Jm", np.matrix([[self.a, 0.0, self.d]]).T, self.Im)
        #self.cm=Marker(np.matrix([[self.a*self.scale, 0, self.d*self.scale]]).T, self.Im)
        self.update()
        self.calllist1=None
        self.calllist2=None
        self.init=False
        
    def update(self):
        self.Jm.update(self.rotx)
        #self.cm.update(self.rotx)
    
    def twoCyn(self, c1, c2, d=0, nor=[0,0,1.0]):
        leng=len(c1)
        glBegin(GL_QUADS)
        for i in range(leng):
            ii=(i+1)%leng
            n=[c1[i][j]+c1[ii][j] for j in [0,1,2]]
            n[2]=n[2]-2*d
            nl=np.sqrt(n[0]*n[0]+n[1]*n[1]+n[2]*n[2])
            n=[v/nl for v in n]
            glNormal3fv(n)
            glVertex3fv(c1[i])
            glVertex3fv(c1[ii])
            glVertex3fv(c2[ii])
            glVertex3fv(c2[i])
        glEnd()        
        glBegin(GL_POLYGON)
        glNormal3fv([-v for v in nor])
        for v in c1: glVertex3fv(v)
        glEnd()        
        glBegin(GL_POLYGON)
        glNormal3fv([v for v in nor])
        for v in c2: glVertex3fv(v)
        glEnd()        

    def geoInfo(self):  
        _r=self.r
        scale=1.5
        sign=1.0
        if np.abs(self.d)>0.0: sign=self.d/np.abs(self.d) 
        self.calllist1=glGenLists(1)
        dcircle1=[(_r*np.cos(i), _r*np.sin(i), -_r*scale*sign) for i in np.linspace(0, 350, 35)*d2r]
        dcircle2=[(vs[0], vs[1], self.d+_r*scale*sign) for vs in dcircle1]
        glNewList(self.calllist1, GL_COMPILE)
        self.twoCyn(dcircle1, dcircle2)
        glEndList()
        if self.a>0.0:
            self.calllist2=glGenLists(1)
            acircle1=[(0.0, _r*np.cos(i), _r*np.sin(i)+self.d) for i in np.linspace(0, 350, 35)*d2r]
            acircle2=[(self.a, vs[1], vs[2]) for vs in acircle1]
            glNewList(self.calllist2, GL_COMPILE)
            self.twoCyn(acircle1, acircle2, self.d, [1.0, 0, 0])
            glEndList()
            
    def draw(self):
        m=self.Im
        if not self.init:
            self.geoInfo()
            self.init=True
        glPushMatrix()
        glPushAttrib(GL_COLOR_BUFFER_BIT | GL_POLYGON_BIT)
        glColor3fv(self.color)
        glMultMatrixf(self.Im.DH().flatten('F'))
        if self.calllist1 != None:
            glCallList(self.calllist1)
        if self.calllist2 != None:
            glCallList(self.calllist2)            
        glPopAttrib()    
        glPopMatrix()

class Robot:
    def __init__(self, DHR, colors):
        self.baseM=Marker()
        self.colors=colors
        J=self.baseM
        self.J_L=[]
        i=0
        for dhr_ in DHR:
            i=i+1
            I=Joint("J"+str(i), J)
            lnk=Link("lnk"+str(i), dhr_, I.IM(), self.colors[i-1])
            J=lnk.Jm
            self.J_L.append((I, lnk))

            
    def forwardK(self, thetas):
        for i in range(len(self.J_L)):
            jl=self.J_L[i]
            jl[0].update(thetas[i]) #joint 
            jl[1].update()  #Link
    
    def draw(self):
        for i in range(len(self.J_L)):
            jl=self.J_L[i]
            jl[1].draw()

class RobotDrawingBoard(glcanvas.GLCanvas):
    def __init__(self, parent, robot_):
        glcanvas.GLCanvas.__init__(self, parent, -1, style=wx.WANTS_CHARS)
        self.robot=robot_
        self.minx=-5
        self.maxx=5
        self.miny=-5
        self.maxy=5
        self.minz=-5
        self.maxz=5
        self.keychar=None
#        self.Bind(wx.EVT_SIZE, self.OnSize)
        self.Bind(wx.EVT_MOUSEWHEEL, self.OnMouseWheel)
        self.Bind(wx.EVT_KEY_DOWN, self.onKeyPress)
        self.Bind(wx.EVT_KEY_UP, self.onKeyPressUp)
        self.Bind(wx.EVT_PAINT, self.OnPaint)
        self.init=False
        

    def InitGL(self):
        self.ViewControl()
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
        glVertex3f(1,0,0)
        glColor3f(0.0,1.0,0.0)
        glVertex3f(0,0,0)
        glVertex3f(0,1,0)
        glColor3f(0.0, 0.0, 1.0)
        glVertex3f(0,0,0)
        glVertex3fv((0,0,1))
        glEnd() 
        glEndList()
        #self.OnDraw()

    def onKeyPressUp(self, evt):
        self.keychar=None
        evt.Skip()

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
                self.OnPaint(evt)
#                self.Refresh()
                self.Update()
        evt.Skip()
    
    def OnMouseWheel(self, evt):    
        rot=evt.GetWheelRotation()
        self.pn=rot/120
        dx=0.1
        dy=0.1
        if self.keychar==None:     
            self.minx=self.minx-dx*self.pn
            self.maxx=self.maxx+dx*self.pn
            self.miny=self.miny-dy*self.pn
            self.maxy=self.maxy+dy*self.pn
        self.ViewControl()  
        self.OnPaint(evt)
#        self.Refresh()
        self.Update()
        evt.Skip()

    def ViewControl(self):
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        disp=-0.1
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
            glLoadIdentity()

    def OnPaint(self, evt):
        self.SetCurrent()
        if not self.init:
            self.InitGL()
            self.init = True
        self.OnDraw()
        evt.Skip()

    def OnDraw(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glCallList(self.axes)
        self.robot.draw()
        self.SwapBuffers()
#        
    def OnSize(self, event):
        wx.CallAfter(self.DoSetViewport)
        event.Skip()

    def DoSetViewport(self):
        if self.IsShown():
            self.SetCurrent()
            size = self.size = self.GetClientSize()
            glMatrixMode(GL_PROJECTION)
            glViewport(0, 0, size.width, size.height)
            glMatrixMode(GL_MODELVIEW)

class MainWindow(wx.Frame):
    def __init__(self, parent = None,id = -1, title = "Syringa Robotics Inc."):        
        wx.Frame.__init__(
                self, parent, id, title, size = (1000,800),
                style = wx.DEFAULT_FRAME_STYLE #| wx.NO_FULL_REPAINT_ON_RESIZE
        )
        scale=0.1
        colors=((1,0,0), (0,1,0.5), (0,0,1), (1,1,0), (1,0,1), (0,1,1))
        DHR=((2.0, 0.0, 90*d2r, 1*scale), (0.2, 1.0, 0.0, 1*scale), (-0.2, 1.0, 0.0*d2r, 1*scale), (0.2, 0.0, 90.0*d2r, 1*scale),
                (0.4, 0.0, 90*d2r, 1*scale), (-0.2, 0.0, 90*d2r, 1*scale))
        self.robot=Robot(DHR, colors[:6])
        self.robot.forwardK([0,0,0, 0,0,0])
        self.glwin=RobotDrawingBoard(self, self.robot)
        box = wx.BoxSizer(wx.HORIZONTAL)
        box.Add(self.glwin, 1, wx.ALIGN_CENTRE|wx.ALL|wx.EXPAND, 5)
        self.SetSizer(box)    
        self.SetAutoLayout(True)
        self.Layout()
        self.CreateStatusBar()
        menubar = wx.MenuBar()
         
        filemenu = wx.Menu()
        menuitem = filemenu.Append(wx.ID_EXIT, "E&xit", "Terminate the program")
        self.Bind(wx.EVT_MENU, self.OnExit, id=wx.ID_EXIT) # here comes the event-handler
        menubar.Append(filemenu,"&File")
       
        actids=[]
        actionmenu=wx.Menu()
        for i in range(1):actids.append(wx.NewId())
        actionmenu.Append(actids[0], "Motion", "Motion")
        self.Bind(wx.EVT_MENU, self.OnMotion, id=actids[0])
        menubar.Append(actionmenu,"&Actions")

        self.SetMenuBar(menubar)
        self.Show(True)
        
    def OnExit(self,evt):
        self.Close()
        evt.Skip()
        
    def OnMotion(self, evt):
        for i in np.linspace(-1, 1, 300)*d2r:
            self.robot.forwardK([i*0, i*0, i*0, 90*d2r+i*120, i*120, i*0])
            self.glwin.OnDraw()
                     
#if __name__=="__main__":
#    DHR=((1, 0, 90*d2r, 1*0.2), (0, 1.0, 0.0, 1*0.2), (0, 1.0, 0.0, 1*0.2))
#    robot=Robot(DHR)
#    robot.forwardK([0*d2r, 30*d2r, -30*d2r])
if __name__=="__main__":        
    app = wx.App()
    frame = MainWindow()
    app.MainLoop()
    del frame
    del app    
