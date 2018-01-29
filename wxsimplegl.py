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

# adapted from http://www.thjsmith.com/40/cylinder-between-two-points-opengl-c
#def link(linkL, linkR, dh_mat, color=(1,1,1,1)):
#    glMaterialfv(GL_FRONT, GL_DIFFUSE, [color[0], color[1], color[2], color[3]])
#    glPushMatrix()
#    glPopMatrix()
    
def cylinder_2p(v1, v2, r, color=[1,1,1,1]):
    glMaterialfv(GL_FRONT, GL_DIFFUSE, [color[0], color[1], color[2], color[3]])

    v2=np.array(v2)
    v1=np.array(v1)
    v2r = v2 - v1
    z = np.array([0.0, 0.0, 1.0])
    # the rotation axis is the cross product between Z and v2r
    ax = np.cross(z, v2r)
    l = math.sqrt(np.dot(v2r, v2r))
    if l<.10e-5:
        return
    # get the angle using a dot product
    angle = 180.0 / math.pi * math.acos(np.dot(z, v2r) / l)
 
    glPushMatrix()
    glTranslatef(v1[0], v1[1], v1[2])
    
    #print "The cylinder between %s and %s has angle %f and axis %s\n" % (v1, v2, angle, ax)
    glRotatef(angle, ax[0], ax[1], ax[2])
    glutSolidCylinder(r, l, 20, 1)
    glPopMatrix()
        
def DrawBlock(l_, w_, h_, center=False):
    l=l_/2.0
    w=w_/2.0
    h=h_/2.0
    if center==False:
        glPushMatrix()
        glTranslatef(0,0,h)
    glBegin(GL_QUADS)
    glNormal3f( 0.0, 0.0, 1.0)
    glVertex3f( l, w, h)
    glVertex3f(-l, w, h)
    glVertex3f(-l,-w, h)
    glVertex3f( l,-w, h)

    glNormal3f( 0.0, 0.0,-1.0)
    glVertex3f(-l,-w,-h  )
    glVertex3f(-l, w,-h  )
    glVertex3f( l, w  ,-h  )
    glVertex3f( l,-w  ,-h  )

    glNormal3f( 0.0, 1.0, 0.0)
    glVertex3f( l  , w  , h  )
    glVertex3f( l  , w  ,-h  )
    glVertex3f(-l  , w  ,-h  )
    glVertex3f(-l  , w  , h  )

    glNormal3f( 0.0,-1.0, 0.0)
    glVertex3f(-l  ,-w  ,-h  )
    glVertex3f( l  ,-w  ,-h  )
    glVertex3f( l  ,-w  , h  )
    glVertex3f(-l  ,-w  , h  )

    glNormal3f( 1.0, 0.0, 0.0)
    glVertex3f( l  , w  , h  )
    glVertex3f( l  ,-w  , h  )
    glVertex3f( l  ,-w  ,-h  )
    glVertex3f( l  , w  ,-h  )

    glNormal3f(-1.0, 0.0, 0.0)
    glVertex3f(-l  ,-w  ,-h  )
    glVertex3f(-l  ,-w  , h  )
    glVertex3f(-l  , w  , h  )
    glVertex3f(-l  , w  ,-h  )
    glEnd()
    if center==False:
        glPopMatrix()
    
    
class MyCanvasBase(glcanvas.GLCanvas):
    def __init__(self, parent):
        glcanvas.GLCanvas.__init__(self, parent, -1)
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
        self.xytablebase=None
        self.xtable=None
        self.ytable=None
        self.ztable=None
        self.time=0.0
        self.plate_tool=None
    
    def setTime(self, t):
        self.time=t
        
    def OnEraseBackground(self, event):
        pass # Do nothing, to avoid flashing on MSW.

    def OnSize(self, event):
        size = self.size = self.GetClientSize()
        if self.GetContext():
            self.SetCurrent()
            glViewport(0, 0, size.width, size.height)
        event.Skip()

    def OnPaint(self, event):
        dc = wx.PaintDC(self)
        self.SetCurrent()
        if not self.init:
            self.InitGL()
            self.init = True
        self.OnDraw()

    def OnMouseDown(self, evt):
        self.CaptureMouse()
        self.x, self.y = self.lastx, self.lasty = evt.GetPosition()

    def OnMouseUp(self, evt):
        self.lastx, self.lasty = self.x, self.y
        self.ReleaseMouse()

    def OnMouseMotion(self, evt):
        if evt.Dragging() and evt.LeftIsDown():
            self.lastx, self.lasty = self.x, self.y
            self.x, self.y = evt.GetPosition()
            self.Refresh(False)


class CubeCanvas(MyCanvasBase):
    def __init__(self, parent, cube=None):
        MyCanvasBase.__init__(self, parent)
        
    def InitGL(self):
        # set viewing projection
        glMatrixMode(GL_PROJECTION)
#        glFrustum(-1.0, 1.0, -1.0, 1.0, 1.0, 5.0)
        glOrtho(-3.0, 3.0, -3.0, 3.0, -3.5, 5.0)

        # position viewer
        glMatrixMode(GL_MODELVIEW)
        glTranslatef(0.0, 0.0, -3.5)

        # position object
        glRotatef(self.y, 1.0, 0.0, 0.0)
        glRotatef(self.x, 0.0, 1.0, 0.0)

        glEnable(GL_DEPTH_TEST)
        glEnable(GL_LIGHTING)
        glEnable(GL_LIGHT0)
        glColorMaterial ( GL_FRONT,GL_AMBIENT_AND_DIFFUSE  ) 
        glEnable ( GL_COLOR_MATERIAL ) 
        if self.xytablebase==None:
            self.xytablebase=glGenLists(1)
            glNewList(self.xytablebase, GL_COMPILE)
            glPushMatrix()
            DrawBlock(2.0,.2,.2, True)
            glTranslatef(0, .3, .0)
            DrawBlock(2.2, .4, .1, True)
            glTranslatef(0, -.6, .0)
            DrawBlock(2.2, .4, .1, True)
            glPopMatrix()

            glEndList()

        if self.xtable==None:
            self.xtable=glGenLists(1)
            glNewList(self.xtable, GL_COMPILE)
            glPushMatrix()
            glTranslate(0,0,.1)
            DrawBlock(1,.2,.05)
            glPopMatrix()
            glPushMatrix()
            glTranslate(0,0.3,.05)
            DrawBlock(1,.4,.1)
            glPopMatrix()
            glPushMatrix()
            glTranslate(0,-0.3,.05)
            DrawBlock(1,.4,.1)
            glPopMatrix()            
            glPushMatrix()
            glRotatef(90.0, 0.0,0.0,1.0)
            glTranslate(0,0.0,.15)
            DrawBlock(1,.2,.05)
            glPopMatrix()
            glEndList()
        if self.ytable==None:
            self.ytable=glGenLists(1)
            glNewList(self.ytable, GL_COMPILE)
            
            glPushMatrix() 
            glRotatef(90.0, 0.0,0.0,1.0)
            glTranslate(0,0.0,.2)
            DrawBlock(1,.2,.05)
            glPopMatrix()
            
            glPushMatrix() 
            glRotatef(90.0, 0.0,0.0,1.0)
            glTranslate(0,-0.3,.2)
            DrawBlock(1,.4,.1, True)
            glTranslate(0,0.6,0)
            DrawBlock(1,.4,.1, True)
            glPopMatrix()
            
            glEndList()
            
        #if self.ztable==None:
        #    self.ztable=glGenLists(1)
        #    glNewList(self.ztable, GL_COMPILE)
        #    glPushMatrix() 
        #    glTranslate(0,0.5,3*.707-1)
        #    glTranslate(0,0.0,.5)
        #    DrawBlock(.3,.1,.5)
        #    glTranslate(.2,0.0,-.5)
        #    DrawBlock(.1,.1,1)
        #    glTranslate(-2*.2,0, 0)
        #    DrawBlock(.1,.1,1)
        #    glPopMatrix()
        #    glEndList()

        self.lines=glGenLists(1)
        glNewList(self.lines, GL_COMPILE)
        glPushMatrix()
        glBegin(GL_LINES)
        for i in range(-10, 10):
            glVertex3f(i/10.0, -1, 0)
            glVertex3f(i/10.0, 1, 0)
            glVertex3f(-1, i/10.0,  0)
            glVertex3f(1, i/10.0, 0)            
        glEnd()
        glPopMatrix()
        glEndList()

    def OnDraw(self):
        # clear color and depth buffers
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

        glColor3f(1.0, 1.0,1.0)
        glCallList(self.lines)
        
        #glutWireSphere(math.sqrt(1.05*1.05*2), 10, 10) 
        
        cylinder_2p((2.1, 0, 0), (0, 0, 2.1), .03) #rotation guide

        cylinder_2p((0, 0.25, 2.1-.5), (0, 0.25, 3.5), .03) #ztable guide
        cylinder_2p((0, -0.25, 2.1-.5), (0, -0.25, 3.5), .03) #ztable guide
    

        cylinder_2p((0, -0.25, 2.1-.25), (.25, -0.25, 2.1-.25), .03) #ztable guide brace
        cylinder_2p((0, 0.25, 2.1-.25), (.25, 0.25, 2.1-.25), .03) #ztable guide brace
        cylinder_2p((0.25, -0.25, 2.1-.25), (.25, 0.25, 2.1-.25), .03) #ztable guide brace
    
        cylinder_2p((0, -0.25, 2.1-.5), (.5, -0.25, 2.1-.5), .03) #ztable guide brace
        cylinder_2p((0, 0.25, 2.1-.5), (.5, 0.25, 2.1-.5), .03) #ztable guide brace
        cylinder_2p((0.5, -0.25, 2.1-.5), (.5, 0.25, 2.1-.5), .03) #ztable guide brace

        alpha=math.sin(self.time*.03)*45*math.pi/180.0
        x0=1.05*math.cos(-alpha)
        y0=1.05*math.sin(-alpha)
        d=abs(x0+y0-2.1)/math.sqrt(1+1)
        x1=((x0-y0)-(-2.1))/2
        y1=((-x0+y0)-(-2.1))/2
    
        R=1.5
        l=math.sqrt(R*R-d*d)
        x=x1-.707*l
        y=y1+.707*l
        cylinder_2p((x0, 0, y0), (x, 0, y), .03, (1,0,1,1)) #angle link 

        glPushMatrix()
        glColor3f(1.0, 0.0,0.0)
        glRotatef(math.sin(self.time*.03)*45, 0.0, 1.0, 0.0)
        glCallList(self.xytablebase)

        cylinder_2p((0, -1.2, 0), (0, 1.2, 0), .03)  #base rotation shaft 
        glTranslatef(math.sin(self.time*.02)*.5, 0, 0)
        glColor3f(0.0, 0.0,1.0)
        glCallList(self.xtable)

        glColor3f(0.0, 1.0, 0.0)
        glTranslatef(0, math.sin(self.time*.02)*.5, 0)
        glCallList(self.ytable)
        glPopMatrix()

        glPushMatrix()
        glTranslatef(0,0, math.sin(self.time*.02)*.5+.5)
        glPushMatrix()
        glTranslatef(0,0,2.1-.25)
        DrawBlock(-.1,.8,.5)
        glTranslatef(0,0,-.5)
        DrawBlock(-.08,.4,.5)
        cylinder_2p((-.03, -0, 0), (.03, -0, 0), .15) 
        glPopMatrix()
        #glPushMatrix()
        #glTranslatef(-.3,0,0)
        #glTranslatef(0,0,2.1-.25)
        #DrawBlock(-.1,.8,.5)
        #glTranslatef(0,0,-.5)
        #DrawBlock(-.08,.4,.5)
        #cylinder_2p((-.03, -0, 0), (.03, -0, 0), .15) 
        #cylinder_2p((-.03, -0, 0), (.3, -0, 0), .05) 
        #glPopMatrix()
        glTranslatef(-.15,0,2.1-.25-.5)
        glPushMatrix()
        beta=180+math.sin(self.time*.02)*45
        glRotatef(beta, 1, 0, 0)
        cylinder_2p((0, 0, 0), (.0, 0, .2), .08) 
        cylinder_2p((0, 0, .2), (.0, 0, .4), .05) 
        glRotatef(-135, 1, 0, 0)
        cylinder_2p((0, 0, 0), (.0, 0, .4), .02) 
        glPopMatrix()


        cylinder_2p((-.03, -.5, .4), (-.03, .5, .4), .01) 
        cylinder_2p((.03, -.5,  .4), (.03, -.5, .4), .01) 
        x0=.4*math.cos((-beta+135)*math.pi/180)
        y0=.4*math.sin((-beta+135)*math.pi/180)
        #cylinder_2p((.0, y0,  x0), (.0, y0, .4), .01) 
        d=.4-x0
        R=.405
        l=math.sqrt(R*R-d*d)
        x1=.4
        y1=y0+l
        cylinder_2p((.0, y0,  x0), (.0, y1, x1), .01) 

        glPopMatrix()

        if self.size is None:
            self.size = self.GetClientSize()
        w, h = self.size
        w = max(w, 1.0)
        h = max(h, 1.0)
        xScale = 180.0 / w
        yScale = 180.0 / h
        glRotatef((self.y - self.lasty) * yScale, 1.0, 0.0, 0.0);
        glRotatef((self.x - self.lastx) * xScale, 0.0, 1.0, 0.0);
        self.SwapBuffers()

    def OnDrawYZ(self):
	glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glRotatef(45, 0, 0, 1)
        glRotatef(-45, 0, 1, 0)
        glRotatef(45, 1, 0, 0)
	glMatrixMode(GL_MODELVIEW)
        self.SwapBuffers()
	#gluLookAt(-5, -5, 5, 0,0,0, 0, 0, 1)

class MainWindow(wx.Frame):
    def __init__(self, parent = None, id = -1, title = "PyOpenGL Example 1"):
        # Init
        wx.Frame.__init__(
                self, parent, id, title, size = (800,800),
                style = wx.DEFAULT_FRAME_STYLE | wx.NO_FULL_REPAINT_ON_RESIZE
        )
        glutInit()
        self.time_=0.0
        box = wx.BoxSizer(wx.HORIZONTAL)
        self.cube1=CubeCanvas(self)
        box.Add(self.cube1, 1, wx.EXPAND)
        #self.cube2=CubeCanvas(self)
        #box.Add(self.cube2, 1, wx.EXPAND)

        self.SetAutoLayout(True)
        self.SetSizer(box)
        self.Layout()

        # StatusBar
        self.CreateStatusBar()

        # Filemenu
        filemenu = wx.Menu()

        menuitem = filemenu.Append(-1, "&YZ", "Y-Z Plane")
        self.Bind(wx.EVT_MENU, self.OnDrawYZ(), menuitem) # here comes the event-handler
        # Filemenu - Separator
        filemenu.AppendSeparator()

        # Filemenu - About
        menuitem = filemenu.Append(-1, "&About", "Information about this program")
        self.Bind(wx.EVT_MENU, self.OnAbout, menuitem) # here comes the event-handler
        # Filemenu - Separator
        filemenu.AppendSeparator()

        # Filemenu - Exit
        menuitem = filemenu.Append(-1, "E&xit", "Terminate the program")
        self.Bind(wx.EVT_MENU, self.OnExit, menuitem) # here comes the event-handler

        # Menubar
        menubar = wx.MenuBar()
        menubar.Append(filemenu,"&File")
        self.SetMenuBar(menubar)
        self.timer = wx.Timer(self)
        self.Bind(wx.EVT_TIMER, self.UpdateT)
        self.timer.Start(1000.0 / 60.0)

        # Show
        self.Show(True)

    def UpdateT(self, evt): 
        self.cube1.setTime(self.time_)
        #self.cube2.setTime(self.time_)
        self.cube1.Refresh()
        #self.cube2.Refresh()
        self.time_=self.time_+1
    
    def OnDrawYZ(self):
        self.cube1.OnDrawYZ()
        #self.cube2.OnDrawYZ()
        
        
    def OnAbout(self,event):
        message = "Using PyOpenGL in wxPython"
        caption = "About PyOpenGL Example"
        wx.MessageBox(message, caption, wx.OK)

    def OnExit(self,event):
        self.Close(True)  # Close the frame.

app = wx.PySimpleApp()
frame = MainWindow()
app.MainLoop()

# destroying the objects, so that this script works more than once in IDLEdieses Beispiel
del frame
del app
