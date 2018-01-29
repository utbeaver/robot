#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

import wx
import math
import sys
import numpy as np
from wx import glcanvas
from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *


    
# Denavit-Hartenberg Matrix as found on Wikipedia "Denavit-Hartenberg parameters"
def DenHarMat(theta, alpha, a, d): 
    cos_theta = np.cos(theta)
    sin_theta = np.sin(theta)
    cos_alpha = np.cos(alpha)
    sin_alpha = np.sin(alpha)
    #modified DH notion 
    return np.array([
        [cos_theta, -sin_theta, 0, a],
        [sin_theta*cos_alpha, cos_theta*cos_alpha, -sin_alpha, -d*sin_alpha],
        [sin_theta*sin_alpha, cos_theta*sin_alpha, cos_alpha, d*cos_alpha],
        [0, 0, 0, 1],
    ])
#    return np.array([
#        [cos_theta, -sin_theta*cos_alpha, sin_theta*sin_alpha, a*cos_theta],
#        [sin_theta, cos_theta*cos_alpha, -cos_theta*sin_alpha, a*sin_theta],
#        [0, sin_alpha, cos_alpha, d],
#        [0, 0, 0, 1],
#    ])
    
def DrawPrism(w_, h_, l_, color=(1,1,1)):
    w=0.5*w_
    h=0.5*h_
    pts=np.array([[w,h,0],[-w,h,0],[-w,-h, 0],[w,-h,0], [w,h,l_], [-w,h,l_],[-w,-h, l_],[w,-h, l_]])
    glPushAttrib(GL_COLOR_BUFFER_BIT)
   
    glBegin(GL_QUADS)
    glNormal3d(0, 0, -1)
    glVertex3fv(pts[0])
    glVertex3fv(pts[3])
    glVertex3fv(pts[2])
    glVertex3fv(pts[1])

    glNormal3d(0, 0, 1)    
    glVertex3fv(pts[4])
    glVertex3fv(pts[5])
    glVertex3fv(pts[6])
    glVertex3fv(pts[7])  
    
    glNormal3d(1, 0, 0)
    glVertex3fv(pts[3])
    glVertex3fv(pts[0])
    glVertex3fv(pts[4])
    glVertex3fv(pts[7])     

    glNormal3d(0, 1, 0)    
    glVertex3fv(pts[0])
    glVertex3fv(pts[1])
    glVertex3fv(pts[5])
    glVertex3fv(pts[4])

    glNormal3d(-1, 0, 0)    
    glVertex3fv(pts[1])
    glVertex3fv(pts[2])
    glVertex3fv(pts[6])
    glVertex3fv(pts[5]) 

    glNormal3d(0, -1, 0)
    glVertex3fv(pts[2])
    glVertex3fv(pts[3])
    glVertex3fv(pts[7])
    glVertex3fv(pts[6])          
    glEnd()
    glPopAttrib()

def DrawConnection(R, t, color=None):
    r=R/2.0
    d=R*2
    d2r=np.pi/180
    xi=[]
    yi=[]
    xe=[]
    ye=[]
    ne=[]
    ni=[]
    if color!=None:
        glColor3fv(color)
    for i in range(0, 180, 5):
        a=d2r*i
        xi.append(r*np.cos(a))
        yi.append(r*np.sin(a))
        ni.append((-np.cos(a), -np.sin(a),0))
        xe.append(R*np.cos(a))
        ye.append(R*np.sin(a))
        ne.append((np.cos(a), np.sin(a),0)) 
    for i in range(180, 270, 5):
        a=d2r*i
        xi.append(r*np.cos(a))
        yi.append(r*np.sin(a))
        ni.append((-np.cos(a), -np.sin(a),0))
        xe.append(-R)
        ye.append(-(i+5-180)/90.0*d)
        ne.append((-1, 0, 0))    
    for i in range(270, 360, 5):
        a=d2r*i
        xi.append(r*np.cos(a))
        yi.append(r*np.sin(a))
        ni.append((-np.cos(a), -np.sin(a),0))
        xe.append(R)
        ye.append((i-270)/90.0*d-d)
        ne.append((1, 0, 0))                
    len_=len(xe)
    glBegin(GL_QUADS)
    for i in range(len_):
        j=(i+1)%len_
        glNormal3fv((0,0,-1))
        glVertex3f(xe[i], ye[i], 0)
        glVertex3f(xe[j], ye[j], 0)
        glVertex3f(xi[j], yi[j], 0)
        glVertex3f(xi[i], yi[i], 0)
        glNormal3fv((0,0,1))
        glVertex3f(xe[i], ye[i], t)
        glVertex3f(xe[j], ye[j], t)
        glVertex3f(xi[j], yi[j], t)
        glVertex3f(xi[i], yi[i], t) 
        
        glNormal3fv(ne[i])
        glVertex3f(xe[i], ye[i], t)
        glVertex3f(xe[i], ye[i], 0)
        glNormal3fv(ne[j])
        glVertex3f(xe[j], ye[j], 0)
        glVertex3f(xe[j], ye[j], t)
        
        glNormal3fv(ni[i])
        glVertex3f(xe[i], ye[i], 0)
        glVertex3f(xe[i], ye[i], t)
        glNormal3fv(ne[j])
        glVertex3f(xe[j], ye[j], t)
        glVertex3f(xe[j], ye[j], 0)        
    glEnd()    

    
    
def link(linkL, w, h, dh_mat, color=(1,1,1), twist=0):
    glColor3fv(color)
    glPushMatrix()
    glMultMatrixf(dh_mat.flatten('F')) 
    R=h/2
    t=w/3
    glColor3fv(color)
    
    glPushMatrix()  
    glRotatef(90.0, 0.0, 0.0, 1.0)    
    glTranslatef(0, 0, -t/2)
    DrawConnection(R, t*.99)
    glPopMatrix()
    
    if twist != 0:
        glPushMatrix()
        glRotatef(-90.0, 0.0, 0.0, 1.0)
        glRotatef(90, 0,1, 0)
        glTranslatef(0, linkL, w/2-t/2)
        DrawConnection(R, t)
        glPopMatrix()
       
        glPushMatrix()
        glRotatef(-90.0, 0.0, 0.0, 1.0)
        glRotatef(90, 0,1, 0)
        glTranslatef(0, linkL, -w/2-t/2)
        DrawConnection(R, t)
        glPopMatrix()
    else:
        glPushMatrix()
#        DrawConnection(R, t)
        glRotatef(90.0, 0.0, 0.0, 1.0)
        glTranslatef(0, -linkL, w/2-t)
        glRotatef(180.0, 0.0, 0.0, 1.0)
        DrawConnection(R, t)
        glPopMatrix()
    
        glPushMatrix()
        glRotatef(90.0, 0.0, 0.0, 1.0)
        glTranslatef(0, -linkL, -w/2)
        glRotatef(180.0, 0.0, 0.0, 1.0)
        DrawConnection(R, t)
        glPopMatrix()
    
    glRotatef(90.0, 0.0, 1.0, 0.0)
    glTranslatef(0, 0, R*2)
    DrawPrism(w, h, linkL-R*4, color)
    glPopMatrix()
    

    
    
class RobotDrawingBoard(glcanvas.GLCanvas):
    def __init__(self, parent):
        glcanvas.GLCanvas.__init__(self, parent, -1)
#        self.context = glcanvas.GLContext(self)
#        self.SetCurrent(self.context)
        self.init = False
        # initial mouse position
        self.lastx = self.x = 0
        self.lasty = self.y = 0
        self.size = None
        self.Bind(wx.EVT_ERASE_BACKGROUND, self.OnEraseBackground)
        self.Bind(wx.EVT_SIZE, self.OnSize)
        self.Bind(wx.EVT_PAINT, self.OnPaint)
        self.Bind(wx.EVT_LEFT_DOWN, self.OnMouseDown)
        self.Bind(wx.EVT_LEFT_UP, self.OnMouseUp)
        self.Bind(wx.EVT_MOTION, self.OnMouseMotion)
        self.Bind(wx.EVT_MOUSEWHEEL, self.OnMouseWheel)
        self.Bind(wx.EVT_KEY_DOWN, self.onKeyPress)
        self.Bind(wx.EVT_KEY_UP, self.onKeyPressUp)
        self.time=0.0
        self.plate_tool=None
        self.minx=-8
        self.maxx=8
        self.miny=-8+4
        self.maxy=8+4
        self.minz=-8
        self.maxz=8
        self.keychar=None
 
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
#        dc = wx.PaintDC(self)
        self.SetCurrent()
        if not self.init:
            self.InitGL()
            self.init = True
        self.OnDraw()
        event.Skip()
#
    def OnMouseDown(self, evt):
        self.CaptureMouse()
        self.x, self.y = self.lastx, self.lasty = evt.GetPosition()
        evt.Skip()

    def OnMouseUp(self, evt):
        self.lastx, self.lasty = self.x, self.y
        self.ReleaseMouse()
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
#            print prem
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
            glRotate(-90, 1,0,0)
               
    def InitGL(self):
        # set viewing projection
        self.ViewControl()
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
        glVertex3f(0,0,1)
        glEnd() 
        glEndList()
#        
    def OnDraw(self):
        d2r=np.pi/180.0
        # clear color and depth buffers
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glPushMatrix()
        glCallList(self.axes)
        glPushMatrix()
        glTranslate(0, 0, 0.7)
        glutSolidCube(1.4)
        glPopMatrix()
        dh_m0=DenHarMat(45*d2r*0, 0.0*d2r, 0, 2)
        glPushMatrix()
        glMultMatrixf(dh_m0.flatten('F'))
        glRotate(90, 1,0,0)
        glTranslate(0, 0, 0.05)
        DrawConnection(0.3, 0.1, (1,1,0))
        glTranslate(0, 0, -0.2)
        DrawConnection(0.3, 0.1, (1,1,0))
        glPopMatrix()
        
        dh_m=DenHarMat(90.0*d2r, 90.0*d2r, 0.0, 0.0)
        dh_m=np.dot(dh_m0, dh_m)
        link(3, 0.3, 0.6, dh_m, (1,0,0))
        
        dh_m1=DenHarMat(0.0*d2r, 0.0, 3.0, 0.0)
        dh_m1=np.dot(dh_m, dh_m1)
        link(3, 0.3, 0.6, dh_m1, (1,1,0))
        
        dh_m2=DenHarMat(-90.0*d2r, 0.0, 3.0, 0.0)  
        dh_m2=np.dot(dh_m1, dh_m2)
        link(2, 0.2, 0.4, dh_m2, (1,0.5,0))
        
        dh_m3=DenHarMat(-60.0*d2r, 0.0, 2.0, 0.0)  
        dh_m3=np.dot(dh_m2, dh_m3)
        link(1.5, 0.2, 0.4, dh_m3, (1,0.5,1), 1)
        
        dh_m4=DenHarMat(0.0*d2r, 90.0*d2r, 1.5, 0.0)  
        dh_m4=np.dot(dh_m3, dh_m4)
        link(1, 0.15, 0.3, dh_m4, (1,0.5,0.5), 1)
        
        glPopMatrix()
        self.SwapBuffers()



class MainWindow(wx.Frame):
    def __init__(self, parent = None, id = -1, title = "PyOpenGL Example 1"):
        # Init
        wx.Frame.__init__(
                self, parent, id, title, size = (800,800),
                style = wx.DEFAULT_FRAME_STYLE #| wx.NO_FULL_REPAINT_ON_RESIZE
        )
        glutInit()
        self.time_=0.0
        box = wx.BoxSizer(wx.HORIZONTAL)
        self.cube1=RobotDrawingBoard(self)
        box.Add(self.cube1, 1, wx.EXPAND)
 

        self.SetAutoLayout(True)
        self.SetSizer(box)
        self.Layout()

        # StatusBar
        self.CreateStatusBar()

        # Filemenu
        filemenu = wx.Menu()

        # Filemenu - Exit
        menuitem = filemenu.Append(-1, "E&xit", "Terminate the program")
        self.Bind(wx.EVT_MENU, self.OnExit, menuitem) # here comes the event-handler

        # Menubar
        menubar = wx.MenuBar()
        menubar.Append(filemenu,"&File")
        self.SetMenuBar(menubar)
        self.timer = wx.Timer(self)

        self.Show(True)


    def OnExit(self,event):
        self.Close(True)  # Close the frame.
        
 
        
app = wx.PySimpleApp()
frame = MainWindow()
app.MainLoop()

# destroying the objects, so that this script works more than once in IDLEdieses Beispiel
del frame
del app
