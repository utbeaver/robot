
import wx
import sys
import math
import numpy as np
from wx import glcanvas
from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *
np.set_printoptions(precision=4, linewidth=200)

def alpha_beta(al):
    beta1=np.arctan2(1*np.sin(al), 1.0-1.0*np.cos(al))
    ll1=4+4-2*2*2*np.cos(al)
    ll1=np.sqrt(ll1)
    return beta1, ll1

def CreateDelta(dh_ma, level, alpha_, x, y, second=0, base=0):
    d2r=np.pi/180.0
    temp=np.abs(alpha_)
    beta_, ll_=alpha_beta(temp)
    if x==-1: link1(2.0, 0.4, 0.4, level, (1,0,1))
    if alpha_>0:
        ll1=ll_
        ll2=2
        alpha=temp
        beta=beta_
    else:    
        ll1=2
        ll2=ll_
        alpha=beta_
        beta=temp
    if x==1 and base==0:
        #if alpha_>0:
        glPushMatrix()
        tempDH=DenHarMat(-90*d2r, 0, 0, 0)
        level1=np.dot(level, tempDH)  
        link1(2.0, 0.4, 0.4, level1, (1,0,1))
	glPopMatrix()   
    if y==-1: cylinder(0.2, 2.0, level)	
    if alpha_>0:
        alpha_rot=DenHarMat(-alpha, 0, 0, 0)
    else:    
        alpha_rot=DenHarMat(beta, 0, 0, 0)
    levela=np.dot(level, alpha_rot)

    if second==0:
        alpha_rot=DenHarMat(np.pi/2.0, 0, 0, 0)
        dh_ma=np.dot(levela, alpha_rot) 
    toNext=None
    if x==-1:
        dh_m11=DenHarMat(beta, 0,0,0)
        dh_m11=np.dot(level, dh_m11)
        link1(ll1, 0.4, 0.4, dh_m11, (1,0,1))
        if alpha_>0:
	    dh_m11=DhmAlong(dh_m11, np.array([ll1, 0,0,1]))
        else:
            glPushMatrix()
	    tempDH=DenHarMat(-90*d2r, 0.0, 2.0, 0.0)
	    level1=np.dot(dh_m11, tempDH)
	    link1(2.0, 0.4, 0.4, level1, (1,0,1))
            toNext=DhmAlong(level1, (2, 0, 0, 1))
    	    glPopMatrix()
	dh_ma[:,3]=dh_m11[:,3]
    else:    
	dh_m11=DenHarMat(np.pi-alpha, 0, 0, 0)
	dh_m11=np.dot(level, dh_m11)
	link1(ll2, 0.4, 0.4, dh_m11, (1,0,1))
        if alpha_<0:
	    dh_m11=DhmAlong(dh_m11, np.array([ll2, 0,0,1]))
        else:
            glPushMatrix()
	    tempDH=DenHarMat(90*d2r, 0.0, 0.0, 0.0)
	    level1=np.dot(dh_m11, tempDH)
	    link1(2.0, 0.4, 0.4, level1, (1,0,1))
            toNext=DhmAlong(level1, (2, 0, 0, 1))
    	    glPopMatrix()
	dh_ma[:,3]=dh_m11[:,3]
    if y==-1: cylinder(0.2, 2.0, dh_ma)	

    return dh_ma, levela, toNext 
    
# Denavit-Hartenberg Matrix as found on Wikipedia "Denavit-Hartenberg parameters"
def a12(X, R=100.0):
    X_2=X*X
    R_2=R*R
    l_2=R_2+X_2
    l=np.sqrt(l_2)
    h=np.sqrt(R_2-l_2/4.0)
    return np.arctan2(0.5+X*h/l/R, 0.5*X/R-h/l) 

def a34(X, R=100.0):
    X_2=X*X
    R_2=R*R
    l_2=R_2+X_2
    l=np.sqrt(l_2)
    h=np.sqrt(R_2-l_2/4.0)
    return np.arctan2(0.5-X*h/l/R,0.5*X/R+h/l) 

def DHMat(cos_theta, sin_theta, alpha, a, d):    
    cos_alpha = np.cos(alpha)
    sin_alpha = np.sin(alpha)
    return np.array([
        [cos_theta, -sin_theta, 0, a],
        [sin_theta*cos_alpha, cos_theta*cos_alpha, -sin_alpha, -d*sin_alpha],
        [sin_theta*sin_alpha, cos_theta*sin_alpha, cos_alpha, d*cos_alpha],
        [0, 0, 0, 1]
    ])

def DenHarMat(theta, alpha=0, a=0, d=0): 
    cos_theta = np.cos(theta)
    sin_theta = np.sin(theta)
    return DHMat(cos_theta, sin_theta, alpha, a, d)

def DhmAlong(dhm, v_):
    v=np.dot(dhm, v_)
    dhm_=np.copy(dhm)
    dhm_[:,3]=v
    return dhm_

def ParallelTo(dhm, base):
    dhm_=np.copy(dhm)
    dhm_[:3, :3]=base[:3, :3]
    return dhm_

def MoveLocal(m, v):
    temp=np.identity(4)
    temp[:,3]=v
    return np.dot(m, temp)
    
def DrawPrism(w_, h_, l_, color=(1,1,1)):
    h=0.5*h_
    w=0.5*w_
    l=l_/2.0
    pts=np.array([[w,h,-l],[-w,h,-l],[-w,-h, -l],[w,-h,-l], [w,h,l], [-w,h,l],[-w,-h, l],[w,-h, l]])
    glPushAttrib(GL_COLOR_BUFFER_BIT)
    glColor3fv(color)
    glBegin(GL_LINE_LOOP)
    for i in [0,1,2,3]:
        glVertex3fv(pts[i])
    glEnd()			
    glBegin(GL_LINE_LOOP)
    for i in [0,1,2,3]:
        glVertex3fv(pts[i+4])
    glEnd()			
    glBegin(GL_LINES)
    for i in [0,1,2,3]:
        glVertex3fv(pts[i])
        glVertex3fv(pts[i+4])
    glEnd()			
    glPopAttrib()

def half_link(L, R, W, r, t, color=(1,1,0)):
    d2r=np.pi/180.0
    glColor3fv(color)
    for t_ in (t/2.0, -t/2.0):
        glBegin(GL_LINE_LOOP)
        for v in np.linspace(0, 180, 20)*d2r:
            glVertex3f(R*np.cos(v), R*np.sin(v), t_)
        glVertex3f(-W/2.0, -L, t_)    
        glVertex3f(W/2.0, -L, t_)    
        glEnd()
        glBegin(GL_LINE_LOOP)
        for v in np.linspace(0, 350, 35)*d2r:
            glVertex3f(r*np.cos(v), r*np.sin(v), t_)
        glEnd()
    glBegin(GL_LINES)
    for v in np.linspace(0, 180, 20)*d2r:
        glVertex3f(R*np.cos(v), R*np.sin(v), t/2.0)
        glVertex3f(R*np.cos(v), R*np.sin(v), -t/2.0)
    glVertex3f(-W/2.0, -L, t/2.0)    
    glVertex3f(-W/2.0, -L, -t/2.0)    
    glVertex3f(W/2.0, -L, t/2.0)    
    glVertex3f(W/2.0, -L, -t/2.0)    
    glEnd()

def link1(L, R, t1, dh_mat, color=(1,1,1)):
	r=R/2
        glPushAttrib(GL_COLOR_BUFFER_BIT)
	glPushMatrix()
	glMultMatrixf(dh_mat.flatten('F')) 
	d2r=np.pi/180.0
        glColor3fv(color)
	for i in [-1, 1]:
	    t=i*t1	
	    glBegin(GL_LINE_LOOP)
            for v in np.linspace(0, 360, 6)*d2r:
                glVertex3f(R*np.cos(v), R*np.sin(v), t/2.0)
	    glEnd()			
	    glBegin(GL_LINE_LOOP)
	    for v in np.linspace(0, 360, 6)*d2r:
	    	glVertex3f(R*np.cos(v)+L, R*np.sin(v), t/2.0)
	    glEnd()			
	    glBegin(GL_LINES)
	    glVertex3f(0, -R, t/2.0) 
	    glVertex3f(L, -R, t/2.0) 
	    glVertex3f(0, R, t/2.0) 
	    glVertex3f(L, R, t/2.0) 
	    glEnd()			

	    glBegin(GL_LINE_LOOP)
	    for v in np.linspace(0, 360, 6)*d2r:
		glVertex3f(r*np.cos(v), r*np.sin(v), t/2.0)
	    glEnd()			
	    glBegin(GL_LINE_LOOP)
	    for v in np.linspace(0, 360, 6)*d2r:
		glVertex3f(r*np.cos(v)+L, r*np.sin(v), t/2.0)
	    glEnd()			
	glBegin(GL_LINES)
	for v in np.linspace(0, 360, 6)*d2r:
            glVertex3f(R*np.cos(v), R*np.sin(v), t/2.0)
            glVertex3f(R*np.cos(v), R*np.sin(v), -t/2.0)
            glVertex3f(r*np.cos(v), r*np.sin(v), t/2.0)
            glVertex3f(r*np.cos(v), r*np.sin(v), -t/2.0)
            glVertex3f(R*np.cos(v)+L, R*np.sin(v), t/2.0)
            glVertex3f(R*np.cos(v)+L, R*np.sin(v), -t/2.0)
            glVertex3f(r*np.cos(v)+L, r*np.sin(v), t/2.0)
            glVertex3f(r*np.cos(v)+L, r*np.sin(v), -t/2.0)
	glEnd()			
	glPopMatrix()
        glPopAttrib()


def connector(lx, ly, lz, w=None, color=(1,1,0)):
    t=lx/3.0
    R=ly/2.0
    L=lz#-R
    r=R/2.0    
    if w==None:
	w=ly	    
    glPushMatrix()
    glTranslatef(0,0, -t)
    half_link(L, R, w, r, t, color)
    #glTranslatef(0.0,-0.5*(L+R*1.5), 0)
    glTranslatef(0,0, 2*t)
    half_link(L, R, w, r, t, color)
    glPopMatrix()
    
def cylinder(R, L, dh_mat):
    d2r=np.pi/180.0
    glPushMatrix()
    glMultMatrixf(dh_mat.flatten('F')) 
    glBegin(GL_LINE_LOOP)
    for v in np.linspace(0, 360, 6)*d2r:
        glVertex3f(R*np.cos(v), R*np.sin(v), 0)
    glEnd()
    glBegin(GL_LINE_LOOP)
    for v in np.linspace(0, 360, 6)*d2r:
        glVertex3f(R*np.cos(v), R*np.sin(v), L)
    glEnd()
    glBegin(GL_LINES)
    for v in np.linspace(0, 360, 6)*d2r:
        glVertex3f(R*np.cos(v), R*np.sin(v), 0)
        glVertex3f(R*np.cos(v), R*np.sin(v), L)
    glEnd()
    glPopMatrix()
    
def saddle(x, y, scale=1.0):
    z=(-y*y/4.0+x*x)*scale
    dzdx=np.array([1.0, 0,  2.0*x*scale])
    dzdy=np.array([0, 1.0, -0.5**y*scale])
    n=np.cross(dzdx, dzdy)
    n=n/np.sqrt(np.sum(n*n))
    return z, n 

if __name__=="__main__":        
    dr=90
    dl=134.480
    x=np.linspace(-dr, dl, 10)   
    a=np.rad2deg(a12(x))
    b=np.rad2deg(a34(x-dl+dr))
    print a[0]-a[-1]
    print b[0]-b[-1]
