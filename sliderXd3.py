# -*- coding: utf-8 -*-
"""
Created on Sat Jun 18 08:13:24 2016

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
rls=[i*0.95/10+0.001 for i in range(0,11)]
#lls=[i*0.73/10 for i in range(0,11)]
lls=[0+i*1.73/10+0.001 for i in range(0,11)]
XX, YY=np.meshgrid(rls, lls)
ZZ=[]
PA=[]
AP=[]
RR=[]
RA=[]
for ll in lls:
    zz=[]
    pa=[]
    rr=[]
    ap=[]
    ra=[]
    for rl in rls:
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
        X2=X1+cos(th2*d2r)
        Y2=Y1+sin(th2*d2r)
        #ratio12=-np.cos(th1)+(np.cos(th1)-np.sin(2*th1))*np.cos(th1)*(1-np.sin(th1))/b4ac1**1.5+(np.sin(th1)+2*np.cos(th1))/np.sqrt(b4ac1)
        
        a12=-cs+(cs-ss*cs)*(cs-2*ss*cs)/np.power(b4ac1, 1.5)+(ss+2*np.cos(th1*d2r*2))/np.sqrt(b4ac1)
        a12=a12/ratio1**2
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
        X4=X3+cos(th4*d2r)
        Y4=Y3+sin(th4*d2r)
        
        
        oangle=th1[-1]-th1[0]-th3[-1]+th3[0]
        pangle=max(np.max(np.abs(pressureangle1-90)), np.max(np.abs(pressureangle2-90)))
        apangle=np.max((np.abs(pressureangle1-90)+np.abs(pressureangle2-90))/2.0)
        rangle=np.sqrt(np.mean(np.square((np.abs(pressureangle1-90)+np.abs(pressureangle2-90))/2.0)))
        rr_=np.max(np.abs(1.0/ratio1)+np.abs(1.0/ratio2))
        zz.append(oangle)
        pa.append(pangle)
        ap.append(apangle)
        rr.append(rr_)
        ra.append(rangle)
        ratio_array.append( [rl, ll, oangle,  pangle])
       
    ZZ.append(zz)  
    PA.append(pa)   #MAX Pressure angle
    RR.append(rr)   
    AP.append(ap)  #Average  Pressure angle 
    RA.append(ra)  #RMS  Pressure angle
    
#ratio_datas=np.array(ratio_array)
#fig = plt.figure()
#ax = Axes3D(fig)
#ax.scatter(ratio_datas[:,0], ratio_datas[:,1], ratio_datas[:,2])
#ax.set_xlabel('right diap')
#ax.set_ylabel('left diap')
#ax.set_zlabel('Rotation Angle')
#
#fig = plt.figure()
#ax = Axes3D(fig)
#ax.scatter(ratio_datas[:,0], ratio_datas[:,1], ratio_datas[:,3])
#ax.set_xlabel('right diap')
#ax.set_ylabel('left diap')
#ax.set_zlabel('Pressure Angle') 

fig = plt.figure()
ax = Axes3D(fig)
ax.plot_surface(XX, YY, ZZ, rstride=1, cstride=1, alpha=0.3)
cs=ax.contourf(XX, YY, ZZ, 20, offset=0, zdir='z',  cmap=cm.coolwarm)  

cb=fig.colorbar(cs,  ax=ax, shrink=0.9)
#cb.ax.set_ylabel("Pressure Angle (RMS)")
ax.set_xlabel(r'$D_r (unit L)$')
ax.set_ylabel(r'$D_l (unit L)$')
ax.set_zlabel(r'Output Angle ($\theta_3-\theta_1$), degrees')    
ax.set_zlim(0, 300)  
ax.grid()


fig = plt.figure()
ax = Axes3D(fig)
ax.plot_surface(XX, YY, ZZ/(XX+YY), rstride=1, cstride=1, alpha=0.3)
cs=ax.contourf(XX, YY, ZZ/(XX+YY), 20, offset=0, zdir='z',  cmap=cm.coolwarm)  

cb=fig.colorbar(cs,  ax=ax, shrink=0.9)
#cb.ax.set_ylabel("Pressure Angle (RMS)")
ax.set_xlabel(r'$D_r (unit L)$')
ax.set_ylabel(r'$D_l (unit L)$')
ax.set_zlabel(r' ($\theta_3-\theta_1/(D_l+D_r)$ ,degrees/L')    
ax.set_zlim(0, 150)  
ax.grid()

#fig = plt.figure()
#ax = Axes3D(fig)
#ax.plot_surface(XX, YY, RA, rstride=1, cstride=1, alpha=0.3)
#cs=ax.contourf(XX, YY, RA, 40, zdir='z', offset=0, cmap=cm.coolwarm)
#cb=fig.colorbar(cs,  ax=ax, shrink=0.9)
#cb.ax.set_ylabel("Pressure Angle (RMS)")
#ax.set_xlabel('right diap')
#ax.set_ylabel('left diap')
#ax.set_zlabel('Output Angle')    
#ax.set_zlim(0, 50)  
#ax.grid()
 
#fig = plt.figure()
#ax = Axes3D(fig)
#ax.plot_surface(XX, YY, ZZ, rstride=1, cstride=1, alpha=0.3)
#cs=ax.contourf(XX, YY, AP, 40, zdir='z', offset=0, cmap=cm.coolwarm)
#cb=fig.colorbar(cs,  ax=ax, shrink=0.8)
#cb.ax.set_ylabel("Mean Pressure Angle")
#ax.set_xlabel('right diap')
#ax.set_ylabel('left diap')
#ax.set_zlabel('Output Angle')    
#ax.set_zlim(0, 300)  
#ax.grid()
##
#fig = plt.figure()
#ax = Axes3D(fig)
#ax.plot_surface(XX, YY, ZZ, rstride=1, cstride=1, alpha=0.3)
#cs=ax.contourf(XX, YY, PA, 40, zdir='z', offset=0, cmap=cm.coolwarm)
#cb=fig.colorbar(cs,  ax=ax, shrink=0.8)
#cb.ax.set_ylabel("Max Pressure Angle")
#ax.set_xlabel('right diap')
#ax.set_ylabel('left diap')
#ax.set_zlabel('Output Angle')    
#ax.set_zlim(0, 300)  
#ax.grid()
##
#fig = plt.figure()
#ax = Axes3D(fig)
#ax.plot_surface(XX, YY, ZZ, rstride=1, cstride=1, alpha=0.3)
#cs=ax.contourf(XX, YY, XX+YY, 40, zdir='z', offset=0, cmap=cm.coolwarm)
#cb=fig.colorbar(cs,  ax=ax, shrink=0.8)
#cb.ax.set_ylabel("DISP")
#ax.set_xlabel('right diap')
#ax.set_ylabel('left diap')
#ax.set_zlabel('Output Angle')    
#ax.set_zlim(0, 300)  
#ax.grid()
#
#
#fig = plt.figure()
#ax = Axes3D(fig)
#ax.plot_surface(XX, YY, ZZ, rstride=1, cstride=1, alpha=0.3)
#cs=ax.contourf(XX, YY, RR, 40, zdir='z', offset=0, cmap=cm.coolwarm)
#cb=fig.colorbar(cs,  ax=ax, shrink=0.8)
#cb.ax.set_ylabel("Ratio")
#ax.set_xlabel('right diap')
#ax.set_ylabel('left diap')
#ax.set_zlabel('Output Angle')    
#ax.set_zlim(0, 300)  
#ax.grid()



X=X-DT


plt.show()