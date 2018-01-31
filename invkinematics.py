import numpy as np
import matplotlib
from OpenGL.GL import *
d2r=np.pi/180.0
r2d=1.0/d2r



class Marker:
    def __init__(self, _pos=np.matrix([[0.0,0.0,0.0]]).T, _prev=None):
        self.pos=_pos
        self.prevM=_prev
        self.Rot=np.matrix([[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]])
        self.P=self.pos

    def update(self, _m):
        if self.prevM!=None:
            self.Rot=self.prevM.Rot*_m
            self.P=self.Rot*self.pos+self.prevM.P
  
        

class Joint:
    def __init__(self, _J, val=0):
        self.Jm=_J
        self.Im=Marker(np.matrix([[0.0,0.0,0.0]]).T, self.Jm)
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



class link:
    def __init__(self, paras, I=None):
        self.m=1.0
        self.scale=0.5
        self.Im=I
        self.d=paras[0]
        self.a=paras[1]
        self.alpha=paras[2]
        self.r=paras[3]
        c=np.cos(self.alpha)
        s=np.sin(self.alpha)
        self.rotx=np.matrix([[1.0, 0.0, 0.0], [0.0, c, -s], [0.0, s, c]]) 
        self.Jm=Marker(np.matrix([[self.a, 0.0, self.d]]).T, self.Im)
        self.cm=Marker(np.matrix([[self.a*self.scale, 0, self.d*self.scale]]).T, self.Im)
        self.update()
        self.calllist1=None
        self.calllist2=None
        
    def update(self):
        self.Jm.update(self.rotx)
#        print self.rotx
        self.cm.update(self.rotx)
    
    def twoCyn(dc1, ac1):
        glBegin(GL.GL_LINES)
        for v in dc1: 
            glVertex3fv(v)
            glVertex3fv((v[0], v[1], ))
        glEnd()
        glBegin(GL.GL_LINE_LOOP)
        for v in dcircle1:
            glVertex3fv(v)
        glEnd()
        glBegin(GL.GL_LINE_LOOP)
        for v in ac1:
            glVertex3fv(v)
        glEnd()        
    
    def geoinfo(self):  
        _r=self.r
        self.calllist1=glGenLists(1)
        dcircle1=[(_r*np.cos(i), _r*np.sin(i), -_r/2.0) for i in np.linspace(0, 330, 10)*d2r]
        dcircle2=[(vs[0], vs[1], vs[2]+self.d+_r) for vs in dcircle1]
        glNewList(self.calllist1, GL.GL_COMPILE)
        self.twoCyn(dcircle1, dcircle2)
        glEndlist()
        if self.a>0.0:
            self.calllist2=glGenLists(1)
            acircle1=[(0.0, _r*np.cos(i), _r*np.sin(i)+self.d) for i in np.linspace(0, 330, 10)*d2r]
            acircle2=[(self.a, vs[1], vs[2]) for vs in acircle1]
            glNewList(self.calllist2, GL.GL_COMPILE)
            self.twoCyn(acircle1, acircle2)
            glEndlist()
            
    def draw(self):
        if self.calllist1 != None:
            glCallList(self.calllist1)
        if self.calllist2 != None:
            glCallList(self.calllist2)            

        
class Robot:
    def __init__(self, DHR):
        self.baseM=Marker()
        J=self.baseM
        self.J_L=[]
        for dhr_ in DHR:
            I=Joint(J)
            lnk=link(dhr_, I.IM())
            J=lnk.Jm
            self.J_L.append((I, lnk))

            
    def forwardK(self, thetas):
        for i in range(len(self.J_L)):
            jl=self.J_L[i]
            jl[0].update(thetas[i]) 
#            print jl[0].Im.Rot
            jl[1].update()



if __name__=="__main__":
    DHR=((1, 0, 90*d2r, 1*0.2), (0, 1.0, 0.0, 1*0.2), (0, 1.0, 0.0, 1*0.2))
    robot=Robot(DHR)
    robot.forwardK([0*d2r, 30*d2r, -30*d2r])
