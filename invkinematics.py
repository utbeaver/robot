# -*- coding: utf-8 -*-
"""
Created on Tue Jan 30 17:43:48 2018

@author: peilin.song
"""

#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
import numpy as np
import matplotlib
d2r=np.pi/180.0
r2d=1.0/d2r

class rot:
    def __init__(self, ang=0, _xyz="U"):
        self.xyz=_xyz.upper()
        self.M=np.matrix([[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]])
        self.update(ang)
    
    def update(self, a=0):
        c=np.cos(a)
        s=np.sin(a)
        if self.xyz=="X":
            #self.M=np.matrix([[1.0, 0.0, 0.0], [0.0, c,-s], [0.0, s, c]])
            self.M[0,0]=1.0
            self.M[1,1]=c
            self.M[1,2]=-s
            self.M[2,2]=c
            self.M[2,1]=s
        elif self.xyz=='Z':   
            #self.M=np.matrix([[c, -s, 0.0], [s, c, 0.0], [0.0, 0.0, 1.0]])
            self.M[2,2]=1.0
            self.M[0,0]=c
            self.M[0,1]=-s
            self.M[1,1]=c
            self.M[1,0]=s
        return self.M    

class Marker:
    def __init__(self, _pos=np.matrix([[0.0,0.0,0.0]]).T, _prev=None):
        self.pos=_pos
        self.prevM=_prev
        self.Rot=rot()
        self.P=self.pos

    def update(self, _m):
        if self.prevM!=None:
            self.Rot.M=self.prevM.Rot.M*_m
            print self.pos
            self.P=self.Rot.M*self.pos+self.prevM.P
  
        

class Joint:
    def __init__(self, _J, val=0):
        self.J=_J
        self.I=Marker(np.matrix([[0.0,0.0,0.0]]).T, self.J)
        self.val=val
        self.rotz=rot(val, "Z") 

    def update(self, a):
        rot=self.rotz.update(a)
#        print rot
        self.I.update(rot)
        
    def IM(self): return self.J
#    def JM(self): return self.J        



class link:
    def __init__(self, paras, I=None):
        self.m=1.0
        self.scale=0.5
        self.I=I
        self.d=paras[0]
        self.a=paras[1]
        self.alpha=paras[2]
        self.r=paras[3]
        self.rotx=rot(self.alpha, 'X')
        self.J=Marker(np.matrix([[self.a, 0, self.d]]).T, self.I)
        self.cm=Marker(np.matrix([[self.a*self.scale, 0, self.d*self.scale]]).T, self.I)
        self.update()
        
    def update(self):
        self.J.update(self.rotx.M)
        self.cm.update(self.rotx.M)
    

class Robot:
    def __init__(self, DHR):
        self.baseM=Marker()
        J=self.baseM
        self.J_L=[]
        for dhr_ in DHR:
            I=Joint(J)
            lnk=link(dhr_, I.IM())
            J=lnk.J
            self.J_L.append((I, lnk))

            
    def forwardK(self, thetas):
        for i in range(len(self.J_L)):
            jl=self.J_L[i]
            jl[0].update(thetas[i])
#            print jl[0].I.M.M
            
            jl[1].update()



if __name__=="__main__":
    DHR=((1, 0, 90*d2r, 1*0.2), (0, 1.0, 0.0, 1*0.2))
    robot=Robot(DHR)
    robot.forwardK([45*d2r, 30*d2r])