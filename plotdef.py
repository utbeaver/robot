from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
data=np.loadtxt("det.dat")
num1=int(data[0,0])
num2=int(data[0,1])
data=data[1:,:]

x=data[:,0]
y=data[:,1]
z=data[:,2]
d1=data[:,3]
d2=data[:,4]
d=data[:,5]
r=np.sqrt(x*x+z*z)
Z=np.array(z).reshape((num2,num1))
D1=np.array(d1).reshape((num2,num1))
D2=np.array(d2).reshape((num2,num1))
D=np.array(d).reshape((num2,num1))
X=np.array(x).reshape((num2,num1))
R=np.array(r).reshape((num2,num1))

#plt.figure()
#CS = plt.contour(D1, D2, D, 10)
#plt.clabel(CS, inline=1, fontsize=10)
#plt.grid()
#
#plt.figure()
#CS = plt.contour(D1, D2, R, 10)
#plt.clabel(CS, inline=1, fontsize=10)
#plt.grid()
#
#plt.figure()
#CS = plt.contour(D1, D2, np.arctan2(z, x).reshape((30,30))*180.0/np.pi, 10)
#plt.clabel(CS, inline=1, fontsize=10)
#plt.grid()


fig = plt.figure()
ax = Axes3D(fig)

_num2=[]
for i in range(num2):
    j=D[i,:]<-100
    _x=X[i,j]
    if len(_x)==0: continue
    _num2.append(i)
    #ax.scatter(X[i, j], Z[i, j], D[i, j],color='b')
out=[]
ine=[]
for i in _num2:    
    j=D[i,:]<-100
    _x=X[i,j]
    _y=Z[i,j]
    _d=D[i,j]
    if i == _num2[0]: 
        ax.scatter(_x, _y, _d,color='b')
        for k in range(len(_x)):
            ine.append(np.array([_x[k], _y[k], _d[k]]))
    elif i == _num2[-1]:
        ax.scatter(_x, _y, _d,color='r')
        for k in range(len(_x)):
            out.append(np.array([_x[k], _y[k], _d[k]]))
    else:    
        ax.scatter(_x[0], _y[0], _d[0],color='r')
        out.append(np.array([_x[0], _y[0], _d[0]]))
        ax.scatter(_x[-1],_y[-1], _d[-1],color='b')
        ine.append(np.array([_x[-1], _y[-1], _d[-1]]))

out=np.array(out)
oangle=np.arctan2(out[:,1], out[:,0])
idx=np.argsort(oangle) 
oangle=np.arctan2(out[:,1][idx], out[:,0][idx])
Rout=np.sqrt(out[:,1][idx]*out[:,1][idx]+ out[:,0][idx]*out[:,0][idx])
for i in range(len(Rout)):
    print oangle[i]*180/np.pi, Rout[i]

ine=np.array(ine)
iangle=np.arctan2(ine[:,1], ine[:,0])
idx=np.argsort(iangle) 
iangle=np.arctan2(ine[:,1][idx], ine[:,0][idx])
Rin=np.sqrt(ine[:,1][idx]*ine[:,1][idx]+ ine[:,0][idx]*ine[:,0][idx])
for i in range(len(Rin)):
    print iangle[i]*180/np.pi, Rin[i]
plt.show()
