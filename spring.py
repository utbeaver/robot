# -*- coding: utf-8 -*-
"""
Created on Thu Jun 15 20:28:30 2017

@author: admin
"""

import numpy as np
import matplotlib.pyplot as plt
plt.close("all")
al=np.linspace(0, 90, 30)
alpha=al*np.pi/190.0
r=0.6
b=0.20
mg=50*9.8
L=np.sqrt(r*r+b*b-2*r*b*np.cos(alpha+np.pi/2))
X1=r*np.cos(alpha)
Y1=r*np.sin(alpha)
cos_a1=X1/L#np.sqrt(X*X+(Y+b)*(Y+b))
L0=r+b
dL=L0-L
K=22000
F=dL*K*cos_a1
Ms=F*b
Mr=mg*(r-Y1)

XX=np.zeros((4, 30))
YY=np.zeros((4, 30))
R=np.linspace(0,r,4)
i=0
for R_ in R:
    X=R_*np.cos(alpha)
    Y=R_*np.sin(alpha)
    XX[i,:]=X
    YY[i,:]=Y
    i=i+1
XXb=XX
XXu=XX
YYb=YY
YYu=YY+b
ratio=0.3
YYs=YYu-ratio*(YYu-YYb)
dx=XXu[1:,:]-XXb[:3,:]
dy=YYs[1:,:]-YYu[:3,:]
dl=np.sqrt(dx*dx+dy*dy)
dl=dl- np.amin(dl)
KE=0.5*K*dl*dl
Ke=np.sum(KE, axis=0)
plt.plot(al, Ke*2, al, Mr)
plt.grid()
plt.show()