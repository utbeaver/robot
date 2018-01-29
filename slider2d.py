# -*- coding: utf-8 -*-
"""
Created on Mon Sep 05 17:56:50 2016

@author: admin
"""

import numpy as np
from math import *
from numpy import sin, cos, pi, array
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from mpl_toolkits.mplot3d import axes3d, Axes3D
from matplotlib import cm
plt.close("all")
#http://matplotlib.org/mpl_examples/mplot3d/subplot3d_demo.py
d2r=pi/180.0
#right=1.0-0.01
#left=1.70
ratio_array=[]
rls=[i*0.97/10 for i in range(0,1)]
lls=[1+i*0.73/10 for i in range(0,1)]
XX, YY=np.meshgrid(rls, lls)
ZZ=[]
PA=[]
AP=[]
RR=[]
RA=[]
AA=[]
for ll in [1.65]:#lls:
    zz=[]
    pa=[]
    rr=[]
    ap=[]
    ra=[]
    aa=[]
    for rl in [0.97]:#rls:
        right=rl   #0.8
        left=(ll+1*0)   #1.73
        DT=left-right
        X=np.linspace(right, -left, 100)
        #X=np.linspace(0.8, -0.8-DT, 100)
        x2p1=X*X+1
        a=4*x2p1
        b=-4*x2p1*X
        c=x2p1*x2p1-4
        cs1=(-b+np.sqrt(b*b-4*a*c))/(2*a)
        #cs2=(-b-np.sqrt(b*b-4*a*c))/(2*a)
        th1=np.arccos(cs1)/d2r
        ss=np.sin(th1*d2r)
        cs=np.cos(th1*d2r)
        ss2=1.0-ss
        cs2=X-cs
        th2=np.arctan2(ss2,cs2)/d2r
        X1=cs
        Y1=ss
        pressureangle1=th2-th1
        b4ac1=cs*cs+2*ss-1
        ratio1=-ss-(-cs*ss+cs)/np.sqrt(b4ac1)
        a11=ratio1
        X2=X1+cos(th2*d2r)
        Y2=Y1+sin(th2*d2r)
        #ratio12=-np.cos(th1)+(np.cos(th1)-np.sin(2*th1))*np.cos(th1)*(1-np.sin(th1))/b4ac1**1.5+(np.sin(th1)+2*np.cos(th1))/np.sqrt(b4ac1)
        dotTheta1=1.0/a11
        
        a12=-cs+(cs-ss*cs)*(cs-ss*cs)/np.power(b4ac1, 1.5)-(ss*ss-ss-cs*cs)/np.sqrt(b4ac1)
        #a12=a12/ratio1**2
        
        ddotTheta1=-a12*dotTheta1*dotTheta1/a11        
        X=X+DT
        x2p1=X*X+1
        a=4*x2p1
        b=-4*x2p1*X
        c=x2p1*x2p1-4
        cs3=(-b-np.sqrt(b*b-4*a*c))/(2*a)
        #cs2=(-b-np.sqrt(b*b-4*a*c))/(2*a)
        th3=-np.arccos(cs3)/d2r
        X3=np.cos(th3*d2r)
        Y3=np.sin(th3*d2r)
        ss=np.sin(th3*d2r)
        cs=np.cos(th3*d2r)
        ss4=-1-ss
        cs4=X-cs
        th4=np.arctan2(ss4,cs4)/d2r
        pressureangle2=th4-th3
        b4ac2=cs*cs-2*ss-1
        ratio2=-ss+(-cs*ss-cs)/np.sqrt(b4ac2)
        a31=ratio2
        X4=X3+cos(th4*d2r)
        Y4=Y3+sin(th4*d2r)
        dotTheta3=1.0/a31
        a32=-cs-(-cs-ss*cs)*(-cs-ss*cs)/np.power(b4ac2, 1.5)+(ss*ss+ss-cs*cs)/np.sqrt(b4ac2)
        ddotTheta3=-a32*dotTheta3*dotTheta3/a31
        oangle=th1[-1]-th1[0]-th3[-1]+th3[0]
        pangle=max(np.max(np.abs(pressureangle1-90)), np.max(np.abs(pressureangle2-90)))
        apangle=np.max((np.abs(pressureangle1-90)+np.abs(pressureangle2-90))/2.0)
        rangle=(np.abs((pressureangle1-90))+np.abs(pressureangle2-90))/2
        rangle=np.sqrt(np.mean(np.square(rangle)))
        rr_=np.max(np.abs(1.0/ratio1)+np.abs(1.0/ratio2))
        zz.append(oangle)
        pa.append(pangle)
        ap.append(apangle)
        rr.append(rr_)
        ra.append(rangle)
        aa.append(np.max(ddotTheta1))
        ratio_array.append( [rl, ll, oangle,  pangle])
       
    ZZ.append(zz)  
    PA.append(pa)
    RR.append(rr)
    AP.append(ap)
    RA.append(ra)
    AA.append(aa)
    
fig, ax1 = plt.subplots()

#ax2 = ax1.twinx()
#ax1.plot(X-DT, ddotTheta1, 'b-')
#ax2.plot(X-DT, ddotTheta3, 'r-')
#
#ax1.set_xlim([-1.65, .97])
#ax1.set_xlabel('Slider Displacement (Unit L)')
#ax1.set_ylabel(r'$\ddot{\theta}_1 (s^{-2})$', color='b')
#ax2.set_ylabel(r'$\ddot{\theta}_3 (s^{-2})$', color='r')
plt.plot(X-DT, ddotTheta3-ddotTheta1)
plt.xlim(-1.65, .97)
plt.xlabel('Slider Displacement (Unit L)')
plt.ylabel(r'Relative Derivative Acceleration ($s^{-2}$)')
plt.grid()
plt.show()
