# -*- coding: utf-8 -*-
"""
Created on Fri Dec 23 13:07:37 2016

@author: admin
"""

import numpy as np
from math import *
from numpy import sin, cos, pi, array
import matplotlib.pyplot as plt
import scipy.integrate as integrate
import matplotlib.animation as animation
plt.close("all")

def rhs1(X, Y,   ths, R):
    rhs_=np.zeros(2)
    rhs_[0]= X-R*cos(ths[0])-R*cos(ths[0]+ths[1])
    rhs_[1]=Y-R*sin(ths[0])-R*sin(ths[0]+ths[1])
    return np.asmatrix(rhs_).transpose()
    

    
def Jdisp1(X,  ths, R): 
    J=np.zeros((2,2))   
    J[0, 0]= R*sin(ths[0])+R*sin(ths[0]+ths[1]);  J[0, 1]=R*sin(ths[0]+ths[1]);
    J[1, 0]=  -R*cos(ths[0])-R*cos(ths[0]+ths[1]);  J[1, 1]= -R*cos(ths[0]+ths[1]);
    
    return np.asmatrix(J)
    

    
def solver1(X, Y, R, ths0, tol=1.0e-10):
    theta=ths0
    dtheta=ths0
    i=0
    while (i<10):
#    while (dtheta.max()>tol):
        rhs_=rhs1(X,Y, theta, R)
        J=Jdisp1(X, theta, R)
        dtheta=J.I*rhs_
        theta=theta-dtheta
        i=i+1
#    print np.max(np.abs(dtheta)), np.max(np.abs(rhs_))  
    return theta
    

             
def rhs(target, ths, dD, R, th10, th30):
    X=ths[4]
    rhs_=np.zeros(5)
    rhs_[0]= X-R*cos(ths[0])-R*cos(ths[0]+ths[1])
    rhs_[1]=-R-R*sin(ths[0])-R*sin(ths[0]+ths[1])
    rhs_[2]=X+dD-R*cos(ths[2])-R*cos(ths[2]+ths[3])
    rhs_[3]=R-R*sin(ths[2])-R*sin(ths[2]+ths[3])
    rhs_[4]=(ths[0]-th10)+(th30-ths[2])-target
    #print rhs_
#    print ths[0]*r2d-th10*r2d, th30*r2d-ths[2]*r2d, X, target*r2d
    return np.asmatrix(rhs_).transpose()
    
     
def Jdisp(ths, R):    
    J=np.zeros((5,5)) 
    J[0, 0]= R*sin(ths[0])+R*sin(ths[0]+ths[1]);  J[0, 1]=R*sin(ths[0]+ths[1]);      J[0,4]=1.0;
    J[1, 0]=  -R*cos(ths[0])-R*cos(ths[0]+ths[1]);  J[1, 1]= -R*cos(ths[0]+ths[1]);
    J[2,2]=  R*sin(ths[2])+R*sin(ths[2]+ths[3]);   J[2,3]=  R*sin(ths[2]+ths[3]);    J[2,4]=1.0;
    J[3,2]= -R*cos(ths[2])-R*cos(ths[2]+ths[3]);   J[3,3]= -R*cos(ths[2]+ths[3]) 
    J[4,0]=1.0; J[4,2]=-1.0; 
#    print J
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
    
def solver( target, ths, dD, th10, th30, R=1.0, tol=1.0e-10):
    theta=ths
    dtheta=ths        
    i=0
    while (i<10):
        rhs_=rhs(target, theta, dD, R, th10, th30)
        J=Jdisp(theta, R)
#        nJ=numJ(target, theta, dD, R, th10, th30)
#        DJ=J-nJ
#        print DJ
        print J
        dtheta=J.I*rhs_
#        print dtheta
        theta=theta-dtheta
#        print theta*r2d
        i=i+1  
#    print np.max(np.abs(dtheta)), np.max(np.abs(rhs_))    
    return theta
#    
dl=1.6
dr=0.45
dl=1.51
dr=0.8  
r2d=180.0/pi;  
dx=dl-dr*0
dy=-1
def init_angle(R_=1.0, dl=1.51, dr=0.8):
    R=R_;

    dD=-(dl-dr)*R
    ths=np.asmatrix([i/r2d for i in [30.0+180, 130]]).transpose()
    ths_=np.asmatrix([i/r2d for i in [91.0, 90.0]]).transpose()
    init_pos=[]
    for X in np.linspace(-dr, dl, 5):
        ths=solver1(X, -R,  R, ths) 
    #    print ths*r2d
        init_pos.append(ths[0])
        ths_=solver1(X+dD, R, R, ths_) 
    #    print ths_*r2d
        init_pos.append(ths_[0])
    return init_pos   

def onSolve(t, ths, init_pos, R=1.0, dl=1.51, dr=0.8):    
    R=R
    r2d=180.0/pi;
    dD=-(dl-dr)*R
    ths=solver( t/r2d, ths, dD,  init_pos[0], init_pos[1])
    return ths
init_pos=init_angle()
ths=np.asmatrix([30+180, 90, 91, 30, 0.0]).transpose()/r2d

for t in np.linspace(0, 240, 5):
    ths=onSolve(t, ths, init_pos)
#    ths=solver( t/r2d, ths, dD,  init_pos[0], init_pos[1])
    plt.plot([0, cos(ths[0]), cos(ths[0])+cos(ths[0]+ths[1])], [0, sin(ths[0]), sin(ths[0])+sin(ths[0]+ths[1])], 'b')
    plt.plot([dx,dx+cos(ths[2]), dx+cos(ths[2])+cos(ths[2]+ths[3])], [0+dy, sin(ths[2])+dy, sin(ths[2])+sin(ths[2]+ths[3])+dy], 'r')
#    print np.abs((ths[2]+pi/2-ths[3])*r2d)#, ths[2]*r2d, ths[3]*r2d
plt.plot([-1, 1+dx], [0,0], 'k')
plt.plot([-1, 1+dx], [dy,dy], 'k')

