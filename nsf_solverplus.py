# -*- coding: utf-8 -*-
"""
Created on Mon Jan 16 11:12:47 2017

@author: admin
"""
import numpy as np
from math import *
#from numpy import sin, cos, pi
import matplotlib.pyplot as plt
import scipy.integrate as integrate
import matplotlib.animation as animation
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
#import nsf_solver
plt.close("all")
np.set_printoptions(precision=2)
np.set_printoptions(linewidth=200)

def dist_(x2, y2, x1=0, y1=0):
    temp=(x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)
    temp=np.sqrt(temp)
    return temp
    
def rhsf(X, Y,   ths, R):
    rhs_=np.zeros(2)
    rhs_[0]= X-R*cos(ths[0])-R*cos(ths[0]+ths[1])
    rhs_[1]=Y-R*sin(ths[0])-R*sin(ths[0]+ths[1])

    return np.asmatrix(rhs_).transpose()
    
def Jdispf(X,  ths, R): 
    J=np.zeros((2,2))   
    J[0, 0]= R*sin(ths[0])+R*sin(ths[0]+ths[1]);  J[0, 1]=R*sin(ths[0]+ths[1]);
    J[1, 0]=  -R*cos(ths[0])-R*cos(ths[0]+ths[1]);  J[1, 1]= -R*cos(ths[0]+ths[1]);    
    return np.asmatrix(J)
    
def solverf(X, Y, R, ths0, tol=1.0e-10):
    theta=ths0
    dtheta=ths0
    i=0
    maxrhs=1.0
#    while (i<10):
    while (maxrhs>tol):
        rhs_=rhsf(X, Y, theta, R)
        J=Jdispf(X, theta, R)
        dtheta=J.I*rhs_
        theta[:2]=theta[:2]-dtheta
        i=i+1
        maxrhs=np.max(np.abs(rhs_))
    theta[2,0]=X    
     
    return theta

def  rhsi(target, Y, R, ths):
#    rhs_=np.zeros(3)
    X=ths[2]
    rhs_[0]= X-R*cos(ths[0])-R*cos(ths[0]+ths[1])
    rhs_[1]=Y-R*sin(ths[0])-R*sin(ths[0]+ths[1])
    rhs_[2]=ths[0]-target
    return np.asmatrix(rhs_).transpose()

def Jdispi(ths, R):
    J=np.zeros((3,3))
    J[0, 0]= R*sin(ths[0])+R*sin(ths[0]+ths[1]);  J[0, 1]=R*sin(ths[0]+ths[1]);    J[0,2]=1.0;
    J[1, 0]=  -R*cos(ths[0])-R*cos(ths[0]+ths[1]);  J[1, 1]= -R*cos(ths[0]+ths[1]); 
    J[2,0]=1.0;
    return np.asmatrix(J)

def solveri(target,  Y, R, ths0,   tol=1.0e-10):
    theta=ths0
    dtheta=ths0
    i=0
    while (i<10):
#    while (dtheta.max()>tol):
        rhs_=rhsi(target, Y, R, theta)
        J=Jdispi(theta, R)
        dtheta=J.I*rhs_
        theta=theta-dtheta
        i=i+1
    return theta        

def rhs(target, ths, dD, R, th10, th30):
    X=ths[4]
    rhs_=np.zeros(5)
    rhs_[0]= X-R*cos(ths[0])-R*cos(ths[0]+ths[1])
    rhs_[1]=R-R*sin(ths[0])-R*sin(ths[0]+ths[1])
    rhs_[2]=X+dD-R*cos(ths[2])-R*cos(ths[2]+ths[3])
    rhs_[3]=-R-R*sin(ths[2])-R*sin(ths[2]+ths[3])
    rhs_[4]=(-ths[0]+th10)+(-th30+ths[2])-target
    return np.asmatrix(rhs_).transpose()
    
     
def Jdisp(ths, R):    
    J=np.zeros((5,5)) 
    J[0, 0]= R*sin(ths[0])+R*sin(ths[0]+ths[1]);  J[0, 1]=R*sin(ths[0]+ths[1]);      J[0,4]=1.0;
    J[1, 0]=  -R*cos(ths[0])-R*cos(ths[0]+ths[1]);  J[1, 1]= -R*cos(ths[0]+ths[1]);
    J[2,2]=  R*sin(ths[2])+R*sin(ths[2]+ths[3]);   J[2,3]=  R*sin(ths[2]+ths[3]);    J[2,4]=1.0;
    J[3,2]= -R*cos(ths[2])-R*cos(ths[2]+ths[3]);   J[3,3]= -R*cos(ths[2]+ths[3]) 
    J[4,0]=-1.0; J[4,2]=1.0; 
    return np.asmatrix(J)
    
def numJ(target, ths, dD, R, th10, th30):
    J=np.zeros((5,5))
    for i in range(5):
        vals=ths.copy()
        vals[i]=vals[i]+1.0e-5
        rhsp=rhs(target, vals, dD, R, th10, th30)   
        vals=ths.copy()
        vals[i]=vals[i]-1.0e-5
        rhsn=rhs(target, vals, dD, R, th10, th30)  
        jj=(rhsp-rhsn)/2.0e-5
        for j in range(5):
            J[j, i]=jj[j]
    return np.asmatrix(J)
    
class object:
    def __init__(self, _n=None):
        self.r2d=180.0/pi
        self.d2r=pi/180.0
        self.name=_n
        
class Frame(object):
    def __init__(self,  x=0, y=0, a=0, prev=None, name_=None):
        object.__init__(self, name_)
        self.Tl=np.identity(2)
        self.Tg=self.Tl
        self.x=x #local
        self.y=y  #local
        self.X=0
        self.Y=0
        self.a0=a        
        self.prev=prev
#        self.updateT(a)
        
    def update(self, a=0):
#        print a*self.r2d, 'x'
        self.updateT(a)
        if self.prev != None:
            self.X=self.prev.X+self.prev.Tg[0,0]*self.x+self.prev.Tg[0,1]*self.y
            self.Y=self.prev.Y+self.prev.Tg[1,0]*self.x+self.prev.Tg[1,1]*self.y
#            print self.prev.X, self.prev.Y, self.x, self.y, self.X, self.Y, 'x'
#            print self.prev.Tg
          
    def Txm(self, r=0, alpha=0, x0=None, y0=None):
        x_=cos(alpha)*r
        y_=sin(alpha)*r
        if x0==None:
            tx=self.X+self.Tg[0,0]*x_+self.Tg[0,1]*y_
            ty=self.Y+self.Tg[1,0]*x_+self.Tg[1,1]*y_
        else:
            tx=x0+self.Tg[0,0]*x_+self.Tg[0,1]*y_
            ty=y0+self.Tg[1,0]*x_+self.Tg[1,1]*y_            
        return (tx, ty)
        
    def updateT(self, a=0): 
        self.a=a+self.a0
#        print a, self.a0
        self.Tl[0,0]=cos(self.a);
        self.Tl[0,1]=-sin(self.a)
        self.Tl[1,0]=-self.Tl[0,1]
        self.Tl[1,1]=self.Tl[0,0] 
        if self.name != None:
            if self.prev!=None:  print  self.prev.Tl, 'x'
            print self.Tl, 'y'
        if self.prev !=None:
            self.Tg=np.dot(self.prev.Tg, self.Tl)
        else:
            self.Tg=self.Tl
        
#    def deriv(self, lx, ly):
#        return (-ly, lx, 1)
#           
def solver( target, ths, dD, th10, th30, R=1.0, tol=1.0e-10):
    theta=ths
    dtheta=ths      
    i=0
    maxv=1.0e10
    while (maxv>tol):
        rhs_=rhs(target, theta, dD, R, th10, th30)
        J=Jdisp(theta, R)
#        nJ=numJ(target, theta, dD, R, th10, th30)
#        DJ=J-nJ
        dtheta=J.I*rhs_
        theta=theta-dtheta
        i=i+1  
        maxv=max(np.max(np.abs(dtheta)), np.max(np.abs(rhs_)))
    return theta


        
class CrankSliderMechanism(object):
    def __init__(self,  R=1.0, Y=1.0, dl=1.51, dr=0.8):
        object.__init__(self)
        self.R=R
        self.Y=Y
        self.dl=dl
        self.dr=dr
        self.Ti=None
        self.Ti2=None
        self.Tf=None
        self.Tf2=None
        self.ths=None
        self.ths0=None
  
        
    def initialize(self, ths=np.asmatrix([150, 180+50, 0]).transpose()):
        self.ths=ths*self.d2r
        self.ths0=ths*self.d2r
        if self.Y>0:
            for X in np.linspace(-self.dr, self.dl, 4):
                self.ths=solverf(X, self.Y,  self.R, self.ths)
                if self.Ti is  None: 
                    self.Ti= self.ths[0,0]    
                    self.Ti2=self.ths[1,0]
                self.Tf=self.ths[0,0]
                self.Tf2=self.ths[1,0]
        else:
            for X in np.linspace(self.dl, self.dr, 4):
                self.ths=solverf(X, self.Y,  self.R, self.ths)
                if self.Ti is  None: 
                    self.Ti= self.ths[0,0]    
                    self.Ti2=self.ths[1,0]
                self.Tf=self.ths[0,0]
                self.Tf2=self.ths[1,0]           
#        print self.ths
        return self.ths
        
    def interp(self, X):
        if self.Y>0:
            ratio=(X*0.99+self.dr*self.R)/(self.dl*self.R+self.R*self.dr)
            t1=self.Ti+ratio*(self.Tf-self.Ti)
            t2=self.Ti2+ratio*(self.Tf2-self.Ti2)
        else:
            ratio=(X*0.99+self.dl*self.R)/(self.dl*self.R+self.R*self.dr)
            t1=self.Ti+ratio*(self.Tf-self.Ti)
            t2=self.Ti2+ratio*(self.Tf2-self.Ti2)
        return np.asmatrix([t1, t2, X]).transpose()
        
    def FK(self, X=None):
        X_=X
        if X==None:
            X_=self.ths[2,0]
        self.ths=self.interp(X_)
            
#        print self.ths0.transpose(), "before"    
        self.ths=solverf(X_, self.Y,  self.R, self.ths) 
#        print self.ths.transpose(), "after"
        return self.ths
        
    def IK(self, target):
        X=target
        tempths=np.asmatrix([target,   self.ths[1],  0]).transpose()  
        tempths=solveri(X, self.Y,  self.R, tempths) 
        return tempths
                
    
    def TiTf(self):
        return [self.Ti, self.Tf] 
        
        

                
class DoubleCrankSliderMechanism(object):
    def __init__(self, XL, YL, XE=0, YE=0, alpha1=180, alpha2=90, refCS=None,   
                 R=1.0, Y=1.0, dl1=1.51, dr1=0.8, dl2=1.51, dr2=0.8):
        object.__init__(self)
        self.Xl=XL;
        self.Yl=YL;
        self.Xe=XE
        self.Ye=YE
        self.csm1=CrankSliderMechanism(R,  Y, dl1, dr1)
        self.ths1=self.csm1.initialize()
        self.csm2=CrankSliderMechanism(R, -Y, dl2, dr2)
        self.ths2=self.csm2.initialize(ths=np.asmatrix([-45, -89, 0]).transpose())

        self.R=R
        self.dl1=dl1
        self.dr1=dr1
        self.dl2=dl2
        self.dr2=dr2
#        print self.ths1
        temp=[self.ths1[0], self.ths1[1], self.ths2[0], self.ths2[1], 0]
        self.Ths=np.asmatrix(temp).transpose()
        self.refCS=refCS
        self.CSn1=Frame(0.0, 0.0, alpha1*self.d2r-np.arctan2(self.Yl, self.Xl), self.refCS)
        self.CS1=Frame(0, 0, 0, self.CSn1)
        self.CS2=Frame(self.Xl, self.Yl, 0, self.CS1)
        self.CSp1=Frame(0,0,alpha2*self.d2r,self.CS2)
        self.CSex=Frame(self.Xe, self.Ye, 0, self.CSp1)
 
    def IK(self, target):
        self.disp=target
        ths=self.csm1.IK(target)
        self.csm2.IK(target)
        
    def FK(self, X=None):
        self.ths1=self.csm1.FK(X)
        self.CSn1.update()
#        print self.CSn1.Tg
        self.CS1.update(-self.ths1[0])
#        print self.CS1.Tl
#        print self.CS1.Tg, self.ths1[0]*self.r2d
#        print self.CS2.Tg, self.CS2.Tl
        self.CS2.update()
#        print self.CS2.Tg
        if X == None:
            self.ths2=self.csm2.FK(X)
        else:
            self.ths2=self.csm2.FK(X-self.csm2.dl*self.R+self.csm1.dr*self.R)
        self.CSp1.update(self.ths2[0])
        self.CSex.update()
#        print self.ths1[:2,0].transpose()*self.r2d, self.ths1[2,0], X
#        print self.ths2[:2,0].transpose()*self.r2d, self.ths2[2,0], X-self.csm2.dl*self.R+self.csm1.dr*self.R
        self.Ths[:2,0]=self.ths1[:2,0]
        self.Ths[2:4,0]=self.ths2[:2,0]
        self.Ths[4,0]=self.ths1[2,0]
#        print self.Ths*self.r2d
#        
    def TiTf(self):
        titf=self.csm1.TiTf()+self.csm2.TiTf()
        return np.array(titf)
        
    def InverseKinematics(self, target):
        self.Ths=solver(target, self.Ths,  -(self.dl2-self.dr1)*self.R,  self.csm1.Ti, self.csm2.Ti, self.R) 
        return self.Ths
        
    def ForwardKinematics(self, T):
        self.CSn1.update()
        self.CS1.update(-T[0])
        self.CS2.update()
        self.CSp1.update(T[2])
        self.CSex.update()
        self.Ths=T


                

class Robot(object):
    def __init__(self):
        object.__init__(self)
        R=50.0
        self.dcsm1=DoubleCrankSliderMechanism(100, 30, 100, 0, 180, 90, None, R, R)
        self.dcsm2=DoubleCrankSliderMechanism(100, 30, 100, 0, 50, 90, self.dcsm1.CSex, R, R)
        self.T=None
        self.updateT()
        self.leftbot=(400, 400)
        self.Xpos=np.zeros((900))
        self.Ypos=np.zeros((900))
        self.D1=np.zeros((900))
        self.D2=np.zeros((900))
        
    def updateT(self, T=None):   
        if T==None:
            dc1=self.dcsm1
            dc2=self.dcsm2
            temp=[dc1.Ths[0,0],dc1.Ths[1,0],dc1.Ths[2,0],dc1.Ths[3,0], dc1.Ths[4,0]]
            temp=temp+[dc2.Ths[0,0],dc2.Ths[1,0],dc2.Ths[2,0],dc2.Ths[3,0], dc2.Ths[4,0]]
            self.T=np.asmatrix(np.array(temp)).transpose()
        else:
            self.T=T
    def ForwardKinematics(self):
#        print T.transpose()
        self.dcsm1.ForwardKinematics(self.T[:5,0])
#        print dist_(self.dcsm1.CSp1.X, self.dcsm1.CSp1.Y, 0,0)
#        print dist_(self.dcsm1.CSex.X, self.dcsm1.CSex.Y, self.dcsm1.CSp1.X, self.dcsm1.CSp1.Y)
        self.dcsm2.ForwardKinematics(self.T[5:,0])
#        print dist_(self.dcsm2.CSn1.X, self.dcsm2.CSn1.Y, self.dcsm2.CSp1.X, self.dcsm2.CSp1.Y)
#        print self.dcsm2.CSn1.X, self.dcsm2.CSn1.Y, self.dcsm2.CSp1.X, self.dcsm2.CSp1.Y       
#        print dist_(self.dcsm2.CSex.X, self.dcsm2.CSex.Y, self.dcsm2.CSp1.X, self.dcsm2.CSp1.Y), 'x'
        
    def eval_rhs(self, Xd, Yd):
#        th11, th12, th13, th14, X1, th21, th22, th23, th24, X2=T
        self.updateT(self.T)
        self.ForwardKinematics()
        
        temp1=rhs(0, self.T[:5,0], -(self.dcsm1.dl2-self.dcsm1.dr1)*self.dcsm1.R, self.dcsm1.R, self.dcsm1.csm1.Ti, self.dcsm1.csm2.Ti)
        temp2=rhs(0, self.T[5:,0], -(self.dcsm2.dl2-self.dcsm2.dr1)*self.dcsm2.R, self.dcsm2.R, self.dcsm2.csm1.Ti, self.dcsm2.csm2.Ti)
        temp=[self.dcsm2.CSex.X-Xd, self.dcsm2.CSex.Y-Yd]
        for i in range(4):temp.append(temp1[i,0])
        for i in range(4):temp.append(temp2[i,0])    
#        print temp        
        return np.asmatrix(temp).transpose()
    
#    def numJ(self, Xd, Yd, T):
        J_=np.zeros((10,10))
        for i in range(10):
            vals=T.copy()
            vals[i]=vals[i]+1.0e-5
            rhsp=self.eval_rhs(Xd, Yd, vals)   
            vals=T.copy()
            vals[i]=vals[i]-1.0e-5
            rhsn=self.eval_rhs(Xd, Yd, vals)  
#            jj=(rhsp-rhsn)/2.0e-5
            for j in range(10):
                J_[j, i]=jj[j]   
        return np.asmatrix(J_)
        
    def deriv(self):
        T=self.T
        J=np.zeros((10, 10))
        J1=Jdisp(T[:5], self.dcsm1.R)
        J2=Jdisp(T[5:], self.dcsm2.R)
        J[2:6, 0:5]=J1[:-1,:]
        J[6:10, 5:10]=J2[:-1,:]
        lx=self.dcsm2.CSex.X-self.dcsm1.CS1.X
        ly=self.dcsm2.CSex.Y-self.dcsm1.CS1.Y
        J[0,0]=ly
        J[1,0]=-lx
        lx=self.dcsm2.CSex.X-self.dcsm1.CSp1.X
        ly=self.dcsm2.CSex.Y-self.dcsm1.CSp1.Y
        J[0,2]=-ly
        J[1,2]=lx        
        lx=self.dcsm2.CSex.X-self.dcsm2.CS1.X
        ly=self.dcsm2.CSex.Y-self.dcsm2.CS1.Y
        J[0,5]=ly
        J[1,5]=-lx
        lx=self.dcsm2.CSex.X-self.dcsm2.CSp1.X
        ly=self.dcsm2.CSex.Y-self.dcsm2.CSp1.Y
        J[0,7]=-ly
        J[1,7]=lx  

        return np.asmatrix(J)            
        
    def ss(delf, J):
        A1=J[:2,  :4]
        A2=J[:2, 5:9]
        B1=J[2:6,  :4]
        B2=J[6:10, 5:9]
        C1= A1*B1.I*np.asmatrix([1,0,1,0]).transpose()
        C2= A2*B2.I*np.asmatrix([1,0,1,0]).transpose()
        
        print np.hstack((C1, C2))
        
    def FK(self, T1=None, T2=None):
        self.dcsm1.FK(T1)
        self.dcsm2.FK(T2)
        self.updateT()
#        plt.plot([0, self.dcsm1.CSp1.X, self.dcsm1.CSex.X], [0, self.dcsm1.CSp1.Y, self.dcsm1.CSex.Y], 'bx')
#        plt.plot([ self.dcsm1.CSex.X, self.dcsm2.CSp1.X, self.dcsm2.CSex.X], [self.dcsm1.CSex.Y, self.dcsm2.CSp1.Y, self.dcsm2.CSex.Y],'rx')        
        return (self.dcsm2.CSex.X, self.dcsm2.CSex.Y)#, self.ths1, self.ths2)
        
    def solve(self, Xd, Yd, T1=None, T2=None):       
        i=0
#        print self.T
        maxrhs=1.0
        if T1!=None:
            self.dcsm1.FK(T1)
        if T2!=None:
            self.dcsm2.FK(T2)
        while(maxrhs>1.0e-11):
#        while (i<10):
            rhs_=self.eval_rhs(Xd, Yd)
#            print self.T.transpose()*self.r2d
            J=self.deriv()
            dtheta=J.I*rhs_
            temp=self.T-dtheta
            self.T=temp
            maxrhs=np.max(np.abs(rhs_))
            i=i+1    
        print "%7.3f, %7.3f, %3d"%(self.T[4,0]/50.0, self.T[9,0]/50.0,  i)  
#        print self.T.transpose(), maxrhs
        plt.plot([0, self.dcsm1.CSp1.X, self.dcsm1.CSex.X], [0, self.dcsm1.CSp1.Y, self.dcsm1.CSex.Y], 'r')
        plt.plot([ self.dcsm1.CSex.X, self.dcsm2.CSp1.X, self.dcsm2.CSex.X], [self.dcsm1.CSex.Y, self.dcsm2.CSp1.Y, self.dcsm2.CSex.Y],'r')
        
#        x1,y1=self.dcsm1.CS1.Txm(self.dcsm1.R, self.T[0,0])
#        x2,y2=self.dcsm1.CS1.Txm(self.dcsm1.R, self.T[0,0]+self.T[1,0], x1, y1)
#        plt.plot([0, x1, x2], [0,y1, y2])
#        
#        x1,y1=self.dcsm1.CS2.Txm(self.dcsm1.R, self.T[2,0])
#        x2,y2=self.dcsm1.CS2.Txm(self.dcsm1.R, self.T[2,0]+self.T[3,0], x1, y1) 
#        plt.plot([self.dcsm1.CS2.X, x1, x2], [self.dcsm1.CS2.Y, y1, y2])
        
#        x1,y1=self.dcsm2.CS1.Txm(self.dcsm2.R, self.T[5,0], self.dcsm2.CS1.X, self.dcsm2.CS1.Y)
#        x2,y2=self.dcsm2.CS1.Txm(self.dcsm2.R, self.T[5,0]+self.T[6,0], x1, y1)
#        plt.plot([self.dcsm2.CS1.X, x1, x2], [self.dcsm2.CS1.Y,y1, y2])        
#        
#        x1,y1=self.dcsm2.CS2.Txm(self.dcsm2.R, self.T[7,0])
#        x2,y2=self.dcsm2.CS2.Txm(self.dcsm2.R, self.T[7,0]+self.T[8,0], x1, y1) 
#        plt.plot([self.dcsm2.CS2.X, x1, x2], [self.dcsm2.CS2.Y, y1, y2])  
        
#        plt.xlim((-100, 400))
#        plt.ylim((-200, 200))
#        print np.max(np.abs(rhs_)), np.max(np.abs(dtheta)) 
        return i #self.T
    


def main():
    xy=[]
    robot=Robot()
    XY=np.linspace(-0.5, 1.3, 2)
    YX=np.linspace(-0.5, 1.3, 2)
    i=0
    for x in np.linspace(-0.799, 1.3, 30):
        for y in  np.linspace(-0.799, 1.3, 30):
#            print x,y
            X, Y=robot.FK(x*50, y*50)
            robot.Xpos[i]=X
            robot.Ypos[i]=Y
            robot.D1[i]=x*50
            robot.D2[i]=y*50
            i=i+1
            
#            print "%7.3f, %7.3f"%(x,y)
#            ii=robot.solve(X, Y, x*50, y*50)
            xy.append(X)
            xy.append(Y)
#            robot.ic1[int(X)+robot.leftbot[0], int(Y)+robot.leftbot[1]]=x
#            robot.ic2[int(X)+robot.leftbot[0], int(Y)+robot.leftbot[1]]=y
            
#            print robot.dcsm2.Ths.transpose()
#            print robot.T.transpose(), 'x'#*robot.r2d   
#        print 50*"x"        
    X, Y=robot.FK()
    print X, Y#    print robot.T.transpose()#*robot.r2d 
#    print robot.ic1
    Y=0
    X=200
    dist=np.zeros((900))
    for i in range(900):
        dx=X-robot.Xpos[i]
        dy=Y-robot.Ypos[i]
        dist[i]=np.sqrt(dx*dx+dy*dy)
    idx=np.argmin(dist)
    d1=robot.D1[idx]
    d2=robot.D2[idx] 
    print d1, d2, "xxx"
    X, Y=robot.FK(d1, d2)
    print X, Y, "yyy"
    for v in np.linspace(0,150, 20):
        x=X+v
        y=Y+v
#        idx=int(x)+400
#        idy=int(y)+400
#        xt=robot.ic1[idx, idy]
#        print xt
#        yt=robot.ic2[idx, idy]
#        print xt*50, yt*50
        ii=robot.solve(x, y, d1, d2)
##    print robot.T.transpose()*robot.r2d  
#    robot.updateT()    
#    X, Y=robot.FK()    
#    print X, Y
    
    plt.scatter(xy[::2], xy[1::2])
    plt.grid()             

        
if __name__ == "__main__":
    main()    