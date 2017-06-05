# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 15:27:00 2015

@author: peilin.song
"""

import numpy as np
from math import *
from numpy import sin, cos, pi, array
import matplotlib.pyplot as plt
import scipy.integrate as integrate
import matplotlib.animation as animation
plt.close("all")

X0=np.array([0.5, 
             0.5, 
             1.0, 
             1.0, 
             120.0*pi/180.0,
             60*pi/180.0,
             1.0,
             -1.0,
             0.0,
             -1.0,
             270.0*pi/180, 
             180.0*pi/180 ])
X0=np.asmatrix(X0).transpose()
V0=np.array([0.0, 0.0, 0.0, 0.0, 1.0, 0.0,0.0, 0.0, 0.0, 0.0, 1.0, 0.0])
V0=np.asmatrix(V0).transpose()


def derivative(X, L):
    J=np.zeros((12,12))
    for i in range(4): 
        J[i,i]=1.0
        J[i+2,i]=1.0
        
        J[i+6,i+6]=1.0        
        J[i+2+6,i+6]=1.0
    for i in [0,1]:
        J[i+2, i]=-1.0
        J[i+2+6, i+6]=-1.0
    J[0,4]=L*sin(X[4])
    J[1,4]=-L*cos(X[4])
    J[2,5]=L*sin(X[5])
    J[3,5]=-L*cos(X[5])
    
    J[0+6,4+6]=L*sin(X[4+6])
    J[1+6,4+6]=-L*cos(X[4+6])
    J[2+6,5+6]=L*sin(X[5+6])
    J[3+6,5+6]=-L*cos(X[5+6])    
    return np.asmatrix(J)

def rhs(X, L, l):
     v=np.zeros(12)
     v[0]=X[0]-L-L*cos(X[4])
     v[1]=X[1]-L*sin(X[4])
     v[2]=X[2]-X[0]-L*cos(X[5])
     v[3]=X[3]-X[1]-L*sin(X[5])
     v[4]=X[2]-l
     v[5]=X[3]-L
     
     v[0+6]=X[0+6]-L-L*cos(X[4+6])
     v[1+6]=X[1+6]-L*sin(X[4+6])
     v[2+6]=X[2+6]-X[0+6]-L*cos(X[5+6])
     v[3+6]=X[3+6]-X[1+6]-L*sin(X[5+6])
     v[4+6]=X[2+6]-l+L
     v[5+6]=X[3+6]+L
     return np.asmatrix(v).transpose()

def rhsforce(X,L):
    v=np.zeros(12)
    v[4]=1.0
    v[10]=-1.0
    return np.asmatrix(v).transpose()
    
def solver(X01, V0, l, tol=1.0e-10):
    L=1
    #lastX=X01
    X=X01
    DX=X
    while (DX.max()>tol):
        rhs_=rhs(X, L, l)
        J=derivative(X,L)
        DX=J.I*rhs_
        #print DX.max()
        X=X-DX
        #print X*180/pi;
    V=J.I*V0   
    rhsf=rhsforce(X,L)
    JT=J.transpose()
    F=JT.I*rhsf
    return np.concatenate((X.T, V.T, F.T))
    


    
states=[]
XX=[]
XX1=[]
VV=[]
VV1=[]
dl=.625

LL=np.arange(1-dl, 2.+dl+.001, .05)
#LL=[1]
X=X0
XVF=None
for l in LL:
    xvf=solver(X, V0, l)
    if XVF==None:
        XVF=xvf
    else:
        XVF=np.concatenate((XVF, xvf))
    X=xvf[0,:].T  
    #print X
    #print l
X=XVF[::3, :]
X[:, 4:6]=X[:, 4:6]*180.0/pi
X[:, 10:12]=X[:, 10:12]*180.0/pi
V=XVF[1::3,:]
F=XVF[2::3,:]
x1=0;y1=1;x2=2;y2=3;t1=4;t2=5
x3=6;y3=7;x4=8;y4=9;t3=10;t4=11

fig=plt.figure()
ax1 = fig.add_subplot(511)
print X[:,t1].max()-X[:,t1].min(), X[:,t3].max()-X[:,t3].min()
ax1.plot(LL, np.asarray(X[:,t1])-X[0,t1], LL, np.asarray(X[:,t3])-X[0,t3])
ax1.grid();ax1.set_xlabel("displacement");ax1.set_ylabel("angle displacement")

ax2=fig.add_subplot(512)
ax2.plot(LL, np.asarray(V[:,t1]), LL, np.asarray(V[:,t3]))
ax2.grid();ax2.set_xlabel("translational V");ax2.set_ylabel("angle V")


ax3=fig.add_subplot(513)
ax3.plot(LL-1.5, -np.asarray(V[:,t1])+np.asarray(V[:,t3]))
ax3.grid();ax3.set_xlabel("translational V");ax3.set_ylabel("angle ratio")

ax4=fig.add_subplot(514)
ax4.plot(LL, np.asarray(X[:,t2])-np.asarray(X[:,t1])+90)
ax4.plot(LL, np.asarray(X[:,t4])-np.asarray(X[:,t3])+90)
ax4.grid();ax4.set_xlabel("translational V");ax4.set_ylabel("pressure angles")

ax5=fig.add_subplot(515)
ax5.plot(LL, np.asarray(X[:,t2]))
ax5.plot(LL, np.asarray(X[:,t4])-180)
ax5.grid();ax5.set_xlabel("translational V");ax5.set_ylabel("pressure angles")

plt.show()        

#    states.append(X)
#if 1==1: 

#    fig = plt.figure()
#    ax = fig.add_subplot(111, autoscale_on=False, xlim=(-1, 3), ylim=(-2, 2))
#    ax.grid()
#    line1, = ax.plot([], [], 'o-', lw=2)
#    line2, = ax.plot([], [], 'o-', lw=2)
#    time_template = 'disp = %.1f'
#    time_text = ax.text(0.05, 0.9, '', transform=ax.transAxes)
#    
#    def init():
#        line1.set_data([], [])
#        line2.set_data([], [])
#        time_text.set_text('')
#        return line1, line2, time_text
#
#    def animate(i):
#
#        xv=states[i]
##        print xv[:,0]
#        x=xv[:,0]
#        thisx = [1, x[0], x[2]]
#        thisy = [0, x[1], x[3]]
#        line1.set_data(thisx, thisy)
#        thisx = [1, x[0+6], x[2+6]]
#        thisy = [0, x[1+6], x[3+6]]
#        line2.set_data(thisx, thisy)    
#        time_text.set_text(time_template%(l))
#
#    
#        return line1, line2, time_text
#        
#    ani = animation.FuncAnimation(fig, animate, np.arange(0,len(states)),interval=200, blit=True, init_func=init)      
#    plt.show()   
