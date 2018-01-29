import numpy as np
import transformations
import math
#from visual import *
import matplotlib.pyplot as plt
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
R=1.0
d2r=math.pi/180.0 
L=1.05

def a_b_c(A, B):
   D=B-A
   L=np.sqrt(np.dot(D, D))
   D=D/L
   return D

#def draw_line(v2, v1, R,  obj=None):
#   if obj==None:
#      obj=cylinder()
#   DL=v2-v1
#   obj.pos=(v1[0], v1[1], v1[2])
#   obj.axis=(DL[0], DL[1], DL[2])
#   obj.radius=R
#   return obj
      
    
dy1=.0
dy2=.0
dx1=.0
dx2=-.0
xb, yb, zb=math.sqrt(2.0)*R*math.cos(30*d2r)*.7, math.sqrt(2.0)*R*math.sin(30*d2r)*.9, 0
xe, ye, ze=xb/2.0, yb/2.5, math.sqrt(2.0)*R*1.0
A=np.array([xb, yb, zb])
A_=np.array([-xb, yb, zb])
B1=np.array([xe+dx1, ye+dy1, ze])
B2=np.array([-xe+dx2, ye+dy2, ze])
d_=a_b_c(A, B1)
d_1=a_b_c(A_, B2)
#print d_

ba=np.sqrt(np.sum(np.square(B1-A)))
ba1=np.sqrt(np.sum(np.square(B2-A_)))
ang1=0*d2r
v11=np.array([R*math.cos(30*d2r)*math.cos(ang1), R*math.sin(30*d2r)*math.cos(ang1), R*math.sin(ang1)]).reshape((3,1))
v21=np.array([R*math.cos(150*d2r)*math.cos(ang1), R*math.sin(150*d2r)*math.cos(ang1), R*math.sin(ang1)]).reshape((3,1))

origin, xaxis, yaxis, zaxis = [0, 0, 0], [1, 0, 0], [0, 1, 0], [0, 0, 1]
looprange=range(0, 360, 1)
data=np.zeros((len(looprange), 30))
iii=0
#f1=frame()
#cylinder(frame=f1, pos=(0,0,0), radius=R, length=.1, color=color.cyan)

#draw_line(B2, A_, .01)
#draw_line(B1, A, .01)

#f1.axis=(0,0,1)
link1=None
link2=None
ang45=45.0*d2r
for i in looprange:
    
    ang=i*d2r
    cs=math.cos(ang)
    ss=math.sin(ang)
    uz=math.cos(ang45)
    uxy=math.sin(ang45)
    ux=uxy*math.cos(ang)
    uy=uxy*math.sin(ang)
#    f1.axis=(ux, uy, uz)
    temp=math.sqrt(uy*uy+uz*uz)
    phi2=math.atan(ux/temp)#*180.0/math.pi
    #phi2=ang
    phi1=-math.atan(uy/uz)#*180.0/math.pi

    Rx = transformations.rotation_matrix(phi1, xaxis)
    Ry = transformations.rotation_matrix(phi2, yaxis)

    RM=transformations.concatenate_matrices(Rx, Ry)[:3, :3]
    RM=np.mat(RM)
    #print v11
    v1=RM*v11
    v2=RM*v21
    for ii in range(3): data[iii, ii]=v1[ii, 0]
    for ii in range(3): data[iii, ii+3]=v2[ii, 0]
    for ii in range(3): data[iii, ii+6]=[ux, uy, uz][ii]
        
    C=np.array([v1[0,0], v1[1,0], v1[2,0]])
    t=-np.dot(A-C, B1-A)/(ba*ba)
    X=A+(B1-A)*t
    for ii in range(3): data[iii, ii+12]=X[ii]
    d=np.sqrt(np.dot(X-np.array([v1[0,0], v1[1,0], v1[2,0]]), X-np.array([v1[0,0], v1[1,0], v1[2,0]])))
    L_=math.sqrt(L*L-d*d)
    XL=X+d_*L_
#    link1=draw_line(XL, np.array([v1[0,0], v1[1,0], v1[2,0]]), .01, link1)
    for ii in range(3): data[iii, ii+15]=XL[ii]
    link_direction=np.array(a_b_c(np.asarray(v1).flatten(), XL))
    normal=np.array([ux, uy, uz])
    data[iii, 18]=math.acos(np.dot( link_direction, normal))/d2r
    
    C=np.array([v2[0,0], v2[1,0], v2[2,0]])
    t=-np.dot(A_-C, B2-A_)/(ba1*ba1)
    X=A_+(B2-A_)*t
    d=np.sqrt(np.dot(X-np.array([v2[0,0], v2[1,0], v2[2,0]]), X-np.array([v2[0,0], v2[1,0], v2[2,0]])))
    L_=math.sqrt(L*L-d*d)
    XL=X+d_1*L_
#    link2=draw_line(XL, np.array([v2[0,0], v2[1,0], v2[2,0]]), .01, link2)
    for ii in range(3): data[iii, ii+19]=XL[ii]
    link_direction=np.array(a_b_c(np.asarray(v2).flatten(), XL))    
    data[iii, 22]=math.acos(np.dot( link_direction, normal))/d2r
    iii=iii+1
 
    

fig=plt.figure()
ax=fig.gca(projection='3d')
ax.plot(data[:,0],data[:,1],data[:,2])
ax.plot(data[:,3],data[:,4],data[:,5])
#ax.plot(data[:,6],data[:,7],data[:,8])
#ax.plot(data[:,6],data[:,7],-data[:,8])
ax.plot([R*math.cos(i*d2r) for i in range(360)], [R*math.sin(i*d2r) for i in range(360)], [0 for i in range(360)])
ax.plot([xb, xe+dx1], [yb, ye+dy1], [zb,ze])
ax.plot([-xb, -xe+dx1], [yb, ye+dy2], [zb,ze])
#for i in range(iii):
 #  ax.plot([data[i,0], data[i, 15]], [data[i,1], data[i, 16]], [data[i,2], data[i, 17]]) 
   #ax.plot([0, data[i, 6]], [0, data[i, 7]],[ 0, data[i, 8]])
   #ax.plot([data[i,6], data[i, 15]], [data[i,7], data[i, 16]], [data[i,8], data[i, 17]])
#for i in looprange:
#   ax.plot([data[i,3], data[i, 19]], [data[i,4], data[i, 20]], [data[i,5], data[i, 21]])    
ax.set_xlim([-1, 1])
ax.set_ylim([-1, 1])
ax.set_zlim([-1, 1])
ax.set_xlabel("X Axis")
ax.set_ylabel("Y Axis")
ax.set_zlabel("Z Axis")
#
fig=plt.figure()
ax1 = plt.subplot(111, polar=True)
ax1.plot(np.array(looprange)*d2r, data[:,18])
ax1.plot(np.array(looprange)*d2r, data[:,22])


plt.show()
