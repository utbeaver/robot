import numpy as np
from math import *
from numpy import sin, cos, pi, array
import matplotlib.pyplot as plt
import matplotlib.animation as animation

th1=np.linspace(1, 120, 100)
d2r=pi/180.0
cs=cos(th1*d2r)
ss=sin(th1*d2r)
X=cs-np.sqrt(cs*cs+2*ss-1)
X1=cs
Y1=ss
ss2=1.0-ss
cs2=X-cs
th2=np.arctan2(ss2,cs2)/d2r
pressureangle=th2-th1
ratio=-ss-(-cs*ss+cs)/np.sqrt(cs*cs+2*ss-1)
X2=X1+cos(th2*d2r)
Y2=Y1+sin(th2*d2r)



fig=plt.figure()
ax1 = fig.add_subplot(311)
ax1.plot(th1, X)
ax1.grid();ax1.set_xlabel("theta1");ax1.set_ylabel(" displacement")
ax2=fig.add_subplot(412)
ax2.plot(th1, th2)
ax2.grid();ax2.set_xlabel("theta1");ax2.set_ylabel("theta2")
ax3=fig.add_subplot(312)
ax3.plot(th1, pressureangle-90)
ax3.grid();ax3.set_xlabel("theta1 ");ax3.set_ylabel("Pressure angle")
ax4=fig.add_subplot(313)
ax4.plot(th1, 1/ratio)
ax4.grid();ax4.set_xlabel("theta1 ");ax4.set_ylabel("ratio")

#print 1/ratio
#fig=plt.figure()
#ax = fig.add_subplot(111, autoscale_on=False, xlim=(-2, 2), ylim=(-2, 2))
#ax.grid()
#ax.plot((-2,2), (1,1))
#ax.plot((-2,2), (0,0))
#ax.plot((-2,2), (-1,-1))
#ax.plot((0,0),(2,-2))
#line, = ax.plot([], [], 'o-', lw=2)
#time_template = 'theta1 = %.1fs'
#time_text = ax.text(0.05, 0.9, '', transform=ax.transAxes)
#
#def init():
#    line.set_data([], [])
#    time_text.set_text('')
#    return line, time_text
#    
#def animate(i):
#    thisx=(0, X1[i], X2[i])
#    thisy=(0, Y1[i], Y2[i])
#    line.set_data(thisx, thisy)
#    time_text.set_text(time_template % (th1[i]))
#    return line, time_text
#
#ani = animation.FuncAnimation(fig, animate, np.arange(1, len(X2)),interval=250, blit=True, init_func=init)

plt.show()
    

