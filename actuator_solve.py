
import sys, math
import numpy as np
def scaleDX(oriX, dx, dl_, dr_):
    x=oriX-dx
    dl=min(1.499,dl_*1.1)
    dr=max(-0.99,-dr_*1.1)
    dx=math.fabs(dx)
    ratio=1.0
    #print x, dl, dr, 'xyz'
    if x>dr and x<dl: 
        return ratio
    elif x<dr:
        desiredDX=math.fabs(dr-oriX)
        ratio=desiredDX/dx
    else:    
        desiredDX=math.fabs(dl-oriX)
        ratio=desiredDX/dx
    return ratio    

def rhs(x, val, dl, dr, a=180.0, b=120.6510262, shift1=0, shift2=0):
    R=1.0
    disp=x[2]
    d2r=np.pi/180.0
    rhs_=np.zeros(3)
    l1_2=disp*disp+R*R
    l1=np.sqrt(l1_2)
    h1=np.sqrt(max(0.0, R*R-l1_2/4.0))
    rhs_[0]=np.cos(x[0])-0.5*disp/R+h1/l1
    disp=disp-(dl-dr)
    l2_2=disp*disp+R*R
    l2=np.sqrt(l2_2)
    h2=np.sqrt(max(0.0, R*R-l2_2/4.0))
    rhs_[1]=np.cos(x[1])-0.5*disp/R-h2/l2
    rhs_[2]=a*d2r-x[0]-shift1*d2r+b*d2r-x[1]-shift2*d2r-val*d2r
    return (np.asmatrix(rhs_).transpose(), l1, h1, l2, h2)


def Jac(x, l1, h1, l2, h2, dl, dr):
    R=1.0
    d2r=np.pi/180.0
    disp=x[2]
    J_=np.zeros((3, 3))
    J_[0,0]=-np.sin(x[0]);  
    J_[1,1]=-np.sin(x[1]);          
    J_[2,0]=-1.0; 
    J_[2,1]=-1.0; 
    J_[0,2]=-0.5-R*R*disp/(l1*l1*l1*h1)
    disp=disp-(dl-dr)
    J_[1,2]=-0.5+R*R*disp/(l2*l2*l2*h2)
    return np.asmatrix(J_)

def numJ(x, val, dl, dr, a=180.0, b=120.6510262):
    J_=np.zeros((3, 3))
    for i in range(3):
        vals=x.copy()
        vals[i]=vals[i]+1.0e-5
        (rhsp, l1, h1, l2, h2)=rhs(vals, val, 0,  dl, dr, a, b)
        vals=x.copy()
        vals[i]=vals[i]-1.0e-5
        (rhsn, l1, h1, l2, h2)=rhs(vals, val, 0, dl, dr, a, b)
        jj=(rhsp-rhsn)/2.0e-5
        for j in range(3):
            J_[j, i]=jj[j]
    return np.asmatrix(J_)
   
def solver(X0, val, dl=1.5, dr=1.0,  a=180.0, b=120.6510262, shift1=0.0, shift2=0.0):
    #print X0.T, val, dl, dr, a, b, shift1, shift2
    d2r=np.pi/180.0
    i=0
    X=X0
    J=None
    maxrhs=1.0
    maxdelta=1.0
    dX=np.copy(X)*0.0
    if 1==1:
        while(maxrhs>1.0e-12 and maxdelta>1.0e-5):
            X=X-dX
            (rhs_, l1, h1, l2, h2)=rhs(X, val, dl, dr, a, b, shift1, shift2)
            J=Jac(X, l1, h1, l2, h2, dl, dr) 	
	    #J_=numJ(X, val, dl, dr, a, b)
            dX=J.getI()*rhs_
            ratio=scaleDX(X[2,0], dX[2,0], dl, dr)
            dX=dX*ratio
            maxrhs= np.abs(rhs_[:,0]).max()
            maxdelta=np.abs(dX[:,0]).max()
            i=i+1
    #print X[0,0]/d2r,X[1,0]/d2r, X[2,0], val 
    return X
    

if __name__ == "__main__":
    d2r=np.pi/180.0
    x=np.asmatrix(np.array([90*d2r, 90*d2r, 0.0])).T
    #x=np.asmatrix(np.array([0.3826, 0.44452, -0.06])).T
    a=175.2952
    b=95.7399
    i=47.43194
    print x[:2,0]/d2r, x[2,0]
    x=solver(x,i, 1.2, 0.6, a, b)
    print x[:2,0]/d2r, x[2,0]
    #print a-x[0,0]/d2r+b-x[1,0]/d2r, i


