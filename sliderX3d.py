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
rls=[i*0.97/10 for i in range(0,11)]
lls=[1+i*0.65/10 for i in range(0,11)]
XX, YY=np.meshgrid(rls, lls)
ZZ=[]
PA=[]
AP=[]
RR=[]
RA=[]
AA=[]
for ll in lls:
    zz=[]
    pa=[]
    rr=[]
    ap=[]
    ra=[]
    aa=[]
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
        dotTheta1=1.0/ratio1
        
        a12=-cs+(cs-ss*cs)*(cs-2*ss*cs)/np.power(b4ac1, 1.5)+(ss+2*np.cos(th1*d2r*2))/np.sqrt(b4ac1)
        a12=a12/ratio1**2
        
        ddotTheta1=-a12*dotTheta1*dotTheta1/ratio1        
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
        aa.append(np.max(ddotTheta3-ddotTheta1))
        ratio_array.append( [rl, ll, oangle,  pangle])
       
    ZZ.append(zz)  
    PA.append(pa)
    RR.append(rr)
    AP.append(ap)
    RA.append(ra)
    AA.append(aa)
    


plt.figure()


CS1 = plt.contour(XX, YY, ZZ, 25, colors='w')
#plt.clabel(CS1, inline=1, fontsize=13, fmt='%4.0f')
CS1 = plt.contour(XX, YY, ZZ/(XX+YY), 25, colors='r')
#plt.clabel(CS1, inline=1, fontsize=15, fmt='%4.0f')
CS2 = plt.contourf(XX, YY, AA, 50)#, cmap=cm.coolwarm)
#plt.colorbar(CS2).set_label('Slider Travel Distance(L)')
plt.colorbar(CS2).set_label(r'Maximum Derivative Acceleration ($s^{-2}$)')


#CS3 = plt.contour(XX, YY, RA, 25, colors='r')
#plt.clabel(CS3, inline=1, fontsize=15, fmt='%4.0f')
#CS4 = plt.contour(XX, YY, XX+YY, 25, colors='y')
#plt.clabel(CS4, inline=1, fontsize=15, fmt='%4.2fL')
##CS = plt.contour(XX, YY, AP, 20, colors='k')
#plt.clabel(CS, inline=1, fontsize=10, fmt=r'%4.0f$^o$')
plt.xlabel(r'$D_r(L)$')
plt.ylabel(r'$D_l(L)$')
#plt.title(r"The Output Range (blue) and  Transmission Ratio (red)")
#plt.title(r"Pressure Angle (RMS) and Maximum Pressure Angle")
#plt.title(r"Travel Distance of the Slider")
plt.grid()
#

#fig = plt.figure()
#ax = Axes3D(fig)
#ax.plot_surface(ZZ, RA, XX+YY, rstride=1, cstride=1, alpha=0.3)
#cs=ax.contourf(XX, YY, AP, 40, zdir='z', offset=0, cmap=cm.coolwarm)
#cb=fig.colorbar(cs,  ax=ax, shrink=0.8)
#cb.ax.set_ylabel("Mean Pressure Angle")
#ax.set_xlabel('right diap')
#ax.set_ylabel('left diap')
#ax.set_zlabel('Output Angle')    
#ax.set_zlim(0, 300)  
#ax.grid()
X=X-DT
#
if 1==0:
    fig=plt.figure()
    ax1 = fig.add_subplot(321)
    ax12 = ax1.twinx()
    ax1.plot(X, th1, 'b')
    ax12.plot(X, th3, 'r')
    ax1.set_ylim(0,150)
    ax12.set_ylim(-180, -30)
    ax1.set_xlim(X[-1], X[0])
    ax1.grid();ax1.set_ylabel(r"$\theta_1$(degree)", color="b");ax12.set_ylabel(r"$\theta_3$(degree)", color="r");
    ax1.set_xlabel("Slider Displacement X (unit L)")
    
    #fig=plt.figure()
    ax1 = fig.add_subplot(322)
    
    ax1.plot(X, th1-th3+th3[0], 'b')#, label='upper mechanism')   #, X, th3+180)
    
    ax1.set_xlim(X[-1], X[0])
    ax1.grid();ax1.set_ylabel(r"$\Delta\theta_1-\Delta\theta_3$(degree)", color="b");#ax12.set_ylabel(r"$\theta_3$(degree)", color="r");
    ax1.set_xlabel("Slider Displacement X (unit L)")
    
    #fig=plt.figure()
    ax2 = fig.add_subplot(323)
    ax22 = ax2.twinx()
    ax2.plot(X, pressureangle1-90, 'b')
    ax22.plot(X, pressureangle2-90, 'r')#, X, (pressureangle1+pressureangle2-180)/2.0 )
    ax2.set_xlim(X[-1], X[0])
    ax2.set_ylim(-80, 40)
    ax22.set_ylim(-80,40)
    
    ax2.grid();ax2.set_ylabel("Pressure Angle at Point A", color="b");ax22.set_ylabel("Pressure Angle at Point C", color='r')
    ax2.set_xlabel("Slider Displacement X (unit L)")
    
    #fig=plt.figure()
    ax2 = fig.add_subplot(324)
    ax2.set_xlim(X[-1], X[0])
    ax2.plot( X, (np.abs(pressureangle1-90)+np.abs(pressureangle2-90))/2.0 )
    ax2.grid();ax2.set_ylabel("Averaged Pressure Angle (degree)", color="b")#;ax22.set_ylabel("Pressure Angle at Point C")
    ax2.set_xlabel("Slider Displacement X (unit L)")
    ax2.set_ylim(0,)
    
    #fig=plt.figure()
    ax3 = fig.add_subplot(325)
    ax32 = ax3.twinx()
    ax3.plot(X, np.fabs(1/ratio1), 'b')
    ax32.plot(X, np.fabs(1/ratio2), 'r')
    ax3.set_xlim(X[-1], X[0])
    ax3.set_ylim(0, )
    ax32.set_ylim(0,)
    ax3.grid();ax3.set_xlabel("Slider Displacement X (unit L)");ax3.set_ylabel("ratio of upper mechamism", color="b");ax32.set_ylabel("ratio of lower mechanism", color="r")
    
    #fig=plt.figure()
    ax3 = fig.add_subplot(326)
    ax3.plot(X, np.fabs(1/ratio1)+np.fabs(1/ratio2), 'b')
    ax3.set_xlim(X[-1], X[0])
    ax3.grid();ax3.set_xlabel("Slider Displacement X (unit L)");ax3.set_ylabel("Composite Ratio of  Mechamism")#, color="b")

if 1==0:
    fig=plt.figure()
    ax = fig.add_subplot(111, autoscale_on=False, xlim=(-2, 2), ylim=(-2, 2))
    ax.grid()
    ax.plot((-2,2), (1,1))
    ax.plot((-2,2), (0,0))
    ax.plot((-2,2), (-1,-1))
    ax.plot((0,0),(2,-2))

    time_template = 'theta1 = %.1fs'

    lines=[]
    def init():
        for i in [0,1]:
            line, = ax.plot([], [], 'o-', lw=1)
            lines.append(line)
            return lines
    
    def animate(i):
        thisx=(0, X1[i], X2[i])
        thisy=(0, Y1[i], Y2[i])
        lines[0].set_data(thisx, thisy)
        thisx=(0, X3[i], X4[i])
        thisy=(0, Y3[i], Y4[i])
        lines[1].set_data(thisx, thisy)    
        return lines
    
    ani = animation.FuncAnimation(fig, animate, np.arange(1, len(X2)), interval=250,  init_func=init)

plt.show()