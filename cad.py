import numpy as np
from numpy import linalg as LA
import time
import FreeCAD, Part, Mesh
import BuildRegularGeoms
import math
from FreeCAD import Base

np.set_printoptions(precision=4, formatter={'float': '{: 10.3f}'.format}, suppress=True)
np.set_printoptions(linewidth=500)
#np.set_printoptions(precision=5, suppress=True)
d2r=np.pi/180.0
r2d=1.0/d2r

def mB(myWidth=1.0, myHeight=1.2, myThickness=0.7):
   aPnt1=Base.Vector(-myWidth/2.,0,0)
   aPnt2=Base.Vector(-myWidth/2.,-myThickness/4.,0)
   aPnt3=Base.Vector(0,-myThickness/2.,0)
   aPnt4=Base.Vector(myWidth/2.,-myThickness/4.,0)
   aPnt5=Base.Vector(myWidth/2.,0,0)
   
   aArcOfCircle = Part.Arc(aPnt2,aPnt3,aPnt4)
   aSegment1=Part.LineSegment(aPnt1,aPnt2)
   aSegment2=Part.LineSegment(aPnt4,aPnt5)
   aEdge1=aSegment1.toShape()
   aEdge2=aArcOfCircle.toShape()
   aEdge3=aSegment2.toShape()
   aWire=Part.Wire([aEdge1,aEdge2,aEdge3])
   
   aTrsf=Base.Matrix()
   aTrsf.rotateZ(math.pi) # rotate around the z-axis
   
   aMirroredWire=aWire.transformGeometry(aTrsf)
   myWireProfile=Part.Wire([aWire,aMirroredWire])
   myFaceProfile=Part.Face(myWireProfile)
   aPrismVec=Base.Vector(0,0,myHeight)
   myBody=myFaceProfile.extrude(aPrismVec)
   myBody=myBody.makeFillet(myThickness/12.0,myBody.Edges)
   neckLocation=Base.Vector(0,0,myHeight)
   neckNormal=Base.Vector(0,0,1)
   myNeckRadius = myThickness / 4.
   myNeckHeight = myHeight / 10
   myNeck = Part.makeCylinder(myNeckRadius,myNeckHeight,neckLocation,neckNormal)	
   myBody = myBody.fuse(myNeck)
   
   faceToRemove = 0
   zMax = -1.0
   
   for xp in myBody.Faces:
       try:
           surf = xp.Surface
           if type(surf) == Part.Plane:
               z = surf.Position.z
               if z > zMax:
                   zMax = z
                   faceToRemove = xp
       except:
           continue
   
   myBody = myBody.makeFillet(myThickness/12.0,myBody.Edges)
   
   return myBody

def makeMeshFromFace(u,v,face):
	(a,b,c,d)=face.ParameterRange
	pts=[]
	for j in range(v):
		for i in range(u):
			s=1.0/(u-1)*(i*b+(u-1-i)*a)
			t=1.0/(v-1)*(j*d+(v-1-j)*c)
			pts.append(face.valueAt(s,t))

	mesh=Mesh.Mesh()
	for j in range(v-1):
		for i in range(u-1):
			mesh.addFacet(pts[u*j+i],pts[u*j+i+1],pts[u*(j+1)+i])
			mesh.addFacet(pts[u*(j+1)+i],pts[u*j+i+1],pts[u*(j+1)+i+1])

	return mesh 

def dotX(x, y):
    dxy=np.dot(x.getA1(), y.getA1())
    return dxy
def crossX(x, y):
    dxy=np.cross(x.getA1(), y.getA1())
    return np.matrix(dxy).T

def Txm(v, mar):
    imp=mar.DH()[:3,3]
    M=mar.DH(3)
    return M.T*(v-imp)

class Marker:
    def __init__(self, _name="baseM", _pos=np.matrix([[0.0,0.0,0.0]]).T, _prev=None):
        self.name=_name
        self.pos=_pos
        self.Rot=np.matrix([[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]])
        self.dh=np.matrix([[1.0, 0.0, 0.0, 0.0], 
                           [0.0, 1.0, 0.0, 0.0], 
                           [0.0, 0.0, 1.0, 0.0], 
                           [0.0, 0.0, 0.0, 1.0]])
        self.prevM=np.matrix([[1.0, 0.0, 0.0, 0.0], 
                           [0.0, 1.0, 0.0, 0.0], 
                           [0.0, 0.0, 1.0, 0.0], 
                           [0.0, 0.0, 0.0, 1.0]])
        if _prev!=None:
            self.prevM=_prev
        self.P=self.pos
    def update(self, _m, xyz=[]):
        self.Rot=self.prevM.Rot*_m
        self.P=self.prevM.Rot*self.pos#+self.prevM.P
        self.dh[:3, :3]=self.Rot
        self.dh[:3, 3]=self.P+self.prevM.dh[:3,3]
        ris=[self.prevM.Rot*r+self.prevM.dh[:3,3]  for r in xyz]
        return ris
    def DH(self, i=4): return self.dh[:i,:i]
    def relP(self): return self.P
    def vec(self):
        v=FreeCAD.Vector(self.dh[0,0], self.dh[1,0], self.dh[2,0])
        return v
            
    def toPl(self, dz=0):
        v=FreeCAD.Vector(self.dh[0,3]-self.dh[0,2]*dz, self.dh[1,3]-self.dh[1,2]*dz, self.dh[2,3]-self.dh[2,2]*dz)
        a1, a2, a3=self.bryant()
        pl=FreeCAD.Placement(v, App.Rotation(a1,a2,a3))
        return pl

    def isRotationMatrix(self) :
        Rt = self.DH(3).T 
        shouldBeIdentity = np.dot(Rt, self.DH(3))
        I = np.identity(3, dtype = Rt.dtype)
        n = np.linalg.norm(I - shouldBeIdentity)
        return n < 1e-6

    def bryant(self) :
        R=self.DH(3)
        if self.isRotationMatrix() is True: return (0,0,0)
        sy = np.sqrt(R[2,1] * R[2,1] +  R[2,2] * R[2,2]) 
        x = np.arctan2(R[1,0] , R[0,0])/d2r
        y = np.arctan2(-R[2,0], sy)/d2r
        z = np.arctan2(R[2,1], R[2,2])/d2r
        return (x, y, z)
  
        
class Joint:
    def __init__(self, _name, _J, val=0):
        self.name=_name
        self.Jm=_J
        self.Im=Marker(self.name+"Im", np.matrix([[0.0,0.0,0.0]]).T, self.Jm)
        self.val=val
        self.rotz=np.matrix([[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]) 

    def update(self, a):
        c=np.cos(a)
        s=np.sin(a)
        self.rotz[2,2]=1.0
        self.rotz[0,0]=c
        self.rotz[0,1]=-s
        self.rotz[1,1]=c
        self.rotz[1,0]=s
        self.Im.update(self.rotz)
        #print self.Jm.DH(3)
        #print self.Im.DH(3)
        #print self.name

    def IM(self): return self.Im

class Link:
    def __init__(self, i, paras, meshes, I=None, color=(1,1,1), last=False):
        self.name="link"+str(i)
        self.K=i
        self.last=last
        self.color=color
        self.m=1.0
        self.scaleK=0.00001
        self.Im=I
        self.d=paras[0]
        self.a=paras[1]
        self.alpha=paras[2]
        self.r=paras[3]
        self.nd=paras[4]
        c=np.cos(self.alpha)
        s=np.sin(self.alpha)
        self.rotx=np.matrix([[1.0, 0.0, 0.0], [0.0, c, -s], [0.0, s, c]]) 
        self.roty=np.matrix([[0.0, 0.0, 1.0], [0.0, 1.0, 0.0], [-1.0, 0.0, 0.0]]) 
        self.Jm=Marker(self.name+"_"+"Jm", np.matrix([[self.a, 0.0, self.d]]).T, self.Im)
        self.geo=Marker(self.name+"_"+"geo", np.matrix([[self.a*0, 0.0, self.d]]).T, self.Im)

        self.calllist1=None
        self.calllist2=None
        self.init=False
        self.da=[np.matrix([[0],[0],[0]])]
        if np.abs(self.d)>0.0:
            self.da.append(np.matrix([[0],[0], [self.d]]))    
        if self.a>0:
            if last == False:
                temp=[np.matrix([[_a], [0], [self.d]]) for _a in np.linspace(0, self.a, 10)]
            else:    
                temp=[np.matrix([[_a], [0], [self.d]]) for _a in np.linspace(0, self.a, 3)]
            self.da=self.da+temp[1:]
        self.update()
        self.pos=None
        self.meshes=meshes
        self.numMesh=len(self.da)
        self.Force1=np.matrix(np.zeros((3,1)))
        self.M1=np.matrix(np.zeros((3,1)))
        self.Force2=np.matrix(np.zeros((3,1)))
        self.M2=np.matrix(np.zeros((3,1)))
        self.dF_dT=np.matrix(np.zeros((3, 6)))
        self.dM_dT=np.matrix(np.zeros((3, 6)))
        self.F=np.matrix([0.0,0.0,0.0]).T
        self.M=np.matrix([0.0,0.0,0.0]).T
        self.J=np.matrix(np.zeros((1, 6)))
        self.flag=(1==0)
        self.normal=None
        self.partd=None
        self.parta=None
        self.geocreated=0

    def setMesh(self, m):
        self.meshes=m
   
    def draw(self):
        if self.geocreated==0: 
            self.geocreated=1
            self.partd=FreeCAD.ActiveDocument.addObject("Part::Feature","partd_%d"%self.K) 
            if self.d>0.0:
                pd=Part.makeCylinder(self.r, self.d)
            else:    
                pd=Part.makeCylinder(self.r, self.r*2+self.d)
            self.partd.Shape=pd
            if self.a>0.0:
                self.parta=FreeCAD.ActiveDocument.addObject("Part::Feature","parta_%d"%self.K) 
                pa=Part.makeCylinder(self.r, self.a)
                self.parta.Shape=pa
        if self.partd is not None:        
            p1=self.Im.toPl(self.r)
            self.partd.Placement=p1
        if self.parta is not None:        
            p2=self.geo.toPl()
            self.parta.Placement=p2
        
    def reset(self):
        self.dF_dT.fill(0.0)
        self.dM_dT.fill(0.0)
        self.Force1.fill(0.0)
        self.M1.fill(0.0)
        self.Force2.fill(0.0)
        self.M2.fill(0.0)
        self.F.fill(0.0)
        self.M.fill(0.0)


    def update(self):
        self.pos=self.Jm.update(self.rotx, self.da)
        self.geo.update(self.roty)
    

    def JM(self): return self.Jm    
    def IM(self): return self.Im    
    def GEO(self): return self.geo    

    def updateK(self, NK=1.0):
        self.scaleK*=NK


    def calFtop(self, robot, txyz, z):
        self.normal=z
        tipPos=self.Jm.DH()[:3,3]
        kk=0.05
        StiffK=np.matrix([[kk,0,0], [0,kk,0],[0,0,0]])
        #local CS
        nn=np.matrix(np.zeros((3,3)))
        x=crossX(np.matrix([1,0,0]).T, z)
        norm_=LA.norm(x)
        if norm_>0.5: x=x/norm_
        else:
            x=crossX(z, np.matrix([0,1,0]).T)
            norm_=LA.norm(x)
            x=x/norm_
        nn[:,0]=x    
        nn[:,2]=z    
        nn[:,1]=crossX(z,x)    
        nkn=nn*StiffK*nn.T
        self.F+=-nkn*(tipPos-txyz)
        if robot is not None:
           for j in robot.nlist:
               self.dF_dT[:,j]=-nkn*robot.dR_dtheta[self.K*3:, j]

    def calF(self, FM, robot=None):
        StiffK=5.0
        Coffs=self.scaleK
        self.F+=FM[0]#.copy()
        self.M+=FM[1]#.copy()
        imp=self.Im.DH()[:3,3]
        impg=self.geo.DH()[:3,3]
        e=self.Im.DH(3)[:,2]
        L=self.JM().relP()
        Lg=self.GEO().relP()
        self.M+=crossX(L, self.F)
        if robot is not None:
            if self.K<robot.nlist[-1]:  #if not the last link, get the J from upper one
                for j in robot.nlist:
                    self.dF_dT[:,j]+=robot.J_L[self.K+1][1].dF_dT[:,j]
                    self.dM_dT[:,j]+=robot.J_L[self.K+1][1].dM_dT[:,j]
            for j in range(self.K+1):
                self.dM_dT[:,j]+=crossX(crossX(robot.e[:,j], L), self.F)
            for j in robot.nlist:
                self.dM_dT[:,j]+=crossX(L, self.dF_dT[:,j])
            dR_dtheta=(robot.dRg_dtheta, robot.dR_dtheta)
        VsIn1=[]
        a2=self.r*self.r
        a2_=1.1*a2
        ms=(self.geo, self.IM())
        temp=self.a
        if self.nd is None and self.normal is None:
            temp*=0.5
        ad=(temp, self.d)
        force=(self.Force1, self.Force2)
        moment=(self.M1, self.M2)
        for ii in [0,1]:
            visin=[]
            m=ms[ii]
            ez=m.DH()[:3,2]
            R=m.DH()[:3,3]
            L=m.relP()
            if ad[ii] is None: continue
            for mesh in self.meshes:
                pts=mesh.Points
                for pp in pts:#range(mesh.Mesh.CountPoints):
                    #p=pp.Vector
                    p=pp
                    xi=np.matrix([p.x, p.y, p.z]).T
                    q=pp.Normal
                    ni=np.matrix([q.x, q.y, q.z]).T
	            dr=Txm(xi, m)
                    if dr[2,0]<-self.r or dr[2,0]>ad[ii]+self.r: continue
                    rg=R-xi
                    re=dotX(rg,ez)*ez
                    r=rg-re
                    r_n=dotX(r, ni)
                    if r_n<0.0: continue
                    #r_n=1
                    r2=dotX(r,r)
                    Flg0=1.0/((r2-a2*0)*np.sqrt(r2))*r*Coffs
                    
                    Flg=r_n*Flg0
                    force[ii][:3,0]+=Flg
                    moment[ii][:3,0]+=crossX(L-re, Flg)
                    if robot is not None:
                        dRdtheta=dR_dtheta[ii][self.K*3:self.K*3+3,:]
                        b2=1/((r2-a2*0)*np.sqrt(r2))
                        b1=b2*b2*(a2*0-3*r2)
                        for j in range(self.K+1):
                            dez_dT=crossX(robot.e[:,j],ez)
                            dL_dT=crossX(robot.e[:,j], L)
                            dR_dt=dRdtheta[:,j]
                            dre_dt=dotX(dR_dt, ez)*ez+dotX(rg,dez_dT)*ez+dotX(rg,ez)*dez_dT
                            drv_dtheta=dR_dt-dre_dt
                            dr_n_dt=dotX(drv_dtheta, ni)*1
                            dFlg=r_n*(b1*dotX(r,drv_dtheta)/np.sqrt(r2)*r+b2*drv_dtheta)*Coffs+dr_n_dt*Flg0
                            dFlg=dFlg
                            self.dF_dT[:,j]+=dFlg
                            self.dM_dT[:,j]+=crossX(dL_dT-dre_dt, Flg)+crossX(L-re, dFlg)  
            self.F+=force[ii][:3,0]#self.Force2[:3,0]    
            self.M+=moment[ii][:3,0]#self.M2[:3,0]
            #if robot: print visin, ii
        if self.normal is not  None: 
            pos=self.pos
        else:    
            pos=self.pos[:-1]
        for i in range(len(pos)):
            out=0    
            pos_=pos[i]
            for mesh in self.meshes:
                if out==1: break
                faces=mesh.Facets
                fps=mesh.Points
                for face in faces:
                    pidx=face.PointIndices
                    p0=np.matrix([fps[pidx[0]].x, fps[pidx[0]].y, fps[pidx[0]].z]).T
                    p1=np.matrix([fps[pidx[1]].x, fps[pidx[1]].y, fps[pidx[1]].z]).T
                    p2=np.matrix([fps[pidx[2]].x, fps[pidx[2]].y, fps[pidx[2]].z]).T
                    z=np.matrix([face.Normal.x, face.Normal.y, face.Normal.z]).T
                    m=np.matrix(np.zeros((3,4)))
                    v1=p1-p0
                    v2=p2-p0
                    x=v1/np.sqrt(v1.T*v1)
                    y=crossX(z, x)
                    m[:,0]=x
                    m[:,1]=y
                    m[:,2]=z
                    m[:,3]=p0
                    _2v=(m[:,:3].T*v1, m[:,:3].T*v2)
                    maxrr=max(v1.T*v1, v2.T*v2)
                    delta=pos_-p0
                    vs=m.T*delta
                    rr=vs[:2,0].T*vs[:2,0]
                    if rr> maxrr: continue
                    if vs[2,0]<-_2v[0][0,0]: continue
                    dz=vs[2,0]-self.r*5.1
                    if dz>0.0: continue
                    u=np.multiply(_2v[0],np.matrix([1.0,1.0, 1.0]).T)
                    v=np.multiply(_2v[1],np.matrix([1.0,1.0, 1.0]).T)
                    uv=u[0,0]*v[1,0]
                    a=(vs[0,0]*v[1,0]-vs[1,0]*v[0,0])/uv
                    #b=-(vs[0,0]*u[1,0]-vs[1,0]*u[0,0]*0)/uv
                    b=-v[0,0]*u[1,0]/uv
                    if a<0 or b<0 or (a+b)>1: continue
                    #print vs[2,0]
                    z=m[:,2]
                    #_f=(-z.T*delta+self.r*1.1)**2.2*z*StiffK
                    _f=(-dz)**2.2*z*StiffK
                    self.F+=_f
                    self.M+=crossX(pos_-imp, _f)
                    if robot is not None:
                        temp=(-dz)**1.2*z*StiffK*2.2
                        for j in range(self.K+1):
                            dd=robot.dR_dtheta[self.K*3:self.K*3+3, j]
                            df_dt=-temp*(z.T*dd)
                            self.dF_dT[:,j]+=df_dt
                            self.dM_dT[:,j]+=crossX(pos_-imp, df_dt)
                            self.dM_dT[:,j]+=crossX(crossX(robot.e[:,j],(pos_-imp)), _f)
                    out=1        
                    break           
            
        self.rhs=dotX(e, self.M)
        if robot is not None:
            for j in robot.nlist:
                self.J[0,j]=dotX(robot.e[:,self.K],self.dM_dT[:,j])
                if j<self.K: self.J[0,j]+=dotX(crossX(robot.e[:,j], robot.e[:,self.K]),self.M)
        self.normal=None    
        return (self.F, self.M, self.rhs)                   


class Robot:
    def __init__(self, DHR, colors=None, meshes=None):
        self.baseM=Marker()
        self.colors=colors
        self.meshes=meshes
        J=self.baseM
        self.J_L=[]
        i=0
        scale=[1,1,1,3,4,1]
        for dhr_ in DHR:
            I=Joint("J"+str(i), J)
            lnk=Link(i, dhr_, self.meshes, I.IM(), self.colors[i], i==len(DHR))
            lnk.updateK(scale[i])
            J=lnk.Jm
            self.J_L.append((I, lnk))
            i=i+1
        nlink=len(self.J_L)
        self.nlink=nlink
        self.nlist=range(nlink)
        self.J=np.matrix(np.zeros((9,9)))    
        self.e=np.matrix(np.zeros((3, nlink)))
        #self.L_=np.matrix(np.zeros((3, nlink)))
        self.L=np.matrix(np.zeros((3, nlink)))
        self.relP=np.matrix(np.zeros((3, nlink)))
        self.relG=np.matrix(np.zeros((3, nlink)))
        self.dR_dtheta=np.matrix(np.zeros((3*nlink, nlink)))
        self.dR_dtheta.fill(0.0)
        self.dRg_dtheta=np.matrix(np.zeros((3*nlink, nlink)))
        self.dRg_dtheta.fill(0.0)
        self.variable=np.matrix(np.zeros((6+3,1)))
        self.rhs=np.matrix(np.zeros((6+3,1)))
        self.J=np.matrix(np.zeros((9,9)))
        self.dM=np.matrix(np.zeros((3*nlink, nlink)))
        self.dF=np.matrix(np.zeros((3*nlink, nlink)))
        self.thetas=np.matrix(np.zeros((nlink+3, 1)))
        self.thetas[6,0]=1.0
        self.thetas[7,0]=1.0
        self.thetas[8,0]=1.0

    def setMesh(self, m):
        for jl in self.J_L:
            jl[1].setMesh(m)
        
    def evalRhs_J(self, txyz=None, _traverse=None):
        self.forwardK()
        self.J.fill(0)
        if txyz is not None:
            self.rhs[6:,0]=self.tipPos-txyz
            if _traverse is not None:
                self.rhs[6,0]=dotX(_traverse, self.rhs[6:,0])
                self.rhs[7.0]=self.rhs[8.0]=0.0
        for i in self.nlist:
            self.e[:,i]=self.J_L[i][0].IM().DH(3)[:,2]
            #self.L_[:,i]=self.J_L[i][0].IM().DH()[:3,3]
            self.L[:,i]=self.J_L[i][1].JM().DH()[:3,3]
            self.relP[:,i]=self.J_L[i][1].JM().relP()
            self.relG[:,i]=self.J_L[i][1].GEO().relP()
        for i in self.nlist[:]:
            i3=3*i
            relP=self.relP[:,i]
            relG=self.relG[:,i]
            for j in range(i+1):
                e=self.e[:,j]
                self.dR_dtheta[i3:i3+3, j]=crossX(e, relP)  
                self.dRg_dtheta[i3:i3+3, j]=crossX(e, relG)  
            if i>0:
                self.dR_dtheta[i3:i3+3, :i]+=self.dR_dtheta[i3-3:i3, :i]  
                self.dRg_dtheta[i3:i3+3, :i]+=self.dR_dtheta[i3-3:i3, :i]  
        if _traverse is None:        
            self.J[6:9,:6]=self.dR_dtheta[i3:i3+3,:]        
            self.J[:6,6:9]=self.dR_dtheta[i3:i3+3,:].T
            FM=(self.thetas[6:,0], np.matrix([0.0,0.0,0.0]).T)
        else:
            self.J[7,7]=self.J[8,8]=1.0
            for i in self.nlist: self.J[6,i]=self.J[i,6]=dotX(_traverse, self.dR_dtheta[i3:i3+3,i])
            FM=(self.thetas[6,0]*_traverse, np.matrix([0.0,0.0,0.0]).T)

        for i in self.nlist[::-1]:
            link=self.J_L[i][1]
            link.reset(), 
            if _traverse is not None and i == self.nlist[-1]:
                link.calFtop(self, txyz, _traverse)
                #FM=(np.matrix([0.0,0.0,0.0]).T, np.matrix([0.0,0.0,0.0]).T)
            FMn=link.calF(FM, self)
            self.rhs[i,0]=FMn[2]
            self.J[i,:6]=link.J[0,:]
            FM=FMn
        return (self.J, self.rhs, 0)        


    def SolvStatic(self, txyz, traverse=None, thetas=None):
        self.forwardK(thetas)
        tol=5.0e-5
        if traverse is not None:
            tol=0.001
        tolf=1.0e-1
        maxr=1.0e10
        factor=1.0/0.75
        converged=0
        ori_states=[self.thetas[i,0] for i in range(9)]
        flag=0
        _1d=np.pi/180.0
        status=0
        hscale=1.0
        iii=0
        dims=9
        if traverse is not None:
            dims=7
        while converged==0:
            for i in range(9):
                self.thetas[i,0]=ori_states[i]
            factor*=0.75
            _thetas=[]
            i=0
            #while i < 50:  
            while i < 5:  
                _thetas.append(self.thetas.copy())
                J, rhs, flag=self.evalRhs_J(txyz, traverse)
                #print J[:dims,:dims]
                #print LA.cond(J[:dims,:dims])
                maxJ=np.amax(np.amax(np.absolute(J[:6,:6])))
                maxj=np.amax(np.amax(np.absolute(J[6:dims,:])))
                hscale=maxJ/maxj
                J[:6,6:dims]*=hscale
                J[6:dims,:6]*=hscale
                #print LA.cond(J[:dims,:dims])
                rhs[6:dims,:]*=hscale
                DX=J[:dims, :dims].I*rhs[:dims,0]*factor
                DX[6:dims,:] *= hscale
                maxf=np.absolute(rhs[:6,0]).max()
                maxr=np.absolute(rhs[6:dims,0]).max()
                i=i+1
                #if (maxf<tolf and maxr<tol) and i>1:
                if (maxr<tol) and i>1:
                    converged=1
                    break
                self.thetas[:dims,0]-=DX[:dims,0]
            #if traverse is None: 
            print maxf, "  ", maxr,"  ",  factor,"  ",  i,"  ",  self.thetas[6:,0].T 
            #else:    
                #print J[:6,:6]
            #    print maxf, maxr, factor, i, self.rhs[6:,0].T 
            iii+=1
            if factor<0.1:
                status=0
                print rhs.T
                break
        #print LA.cond(J)
        return (_thetas, status)    
            
    
    def numDJ(self, thetas, txyz_=None, _traverse=None):
        delta=0.0000001
        numVar=len(thetas)
        numJ=np.matrix(np.zeros((6,numVar)))    
        for i in range(numVar):
            p=[]
            n=[]
            d=thetas.copy()
            d[i,0]=d[i,0]+delta
            self.forwardK(d)
            fm=(self.thetas[6:,0], np.matrix([0.0,0.0,0.0]).T)
            for j in  self.nlist[::-1]:
                self.J_L[j][1].reset()
                if _traverse is not None and j==self.nlist[-1]:
                    self.J_L[j][1].calFtop(None, txyz_, _traverse)
                    fm=(np.matrix([0.0,0.0,0.0]).T, np.matrix([0.0,0.0,0.0]).T)
                fm=self.J_L[j][1].calF(fm)
                p.append(fm[2].copy())
            d[i,0]=d[i,0]-2*delta
            self.forwardK(d)
            fm=(self.thetas[6:,0], np.matrix([0.0,0.0,0.0]).T)
            for j in self.nlist[::-1]:
                self.J_L[j][1].reset()
                if _traverse is not None and j==self.nlist[-1]:
                    self.J_L[j][1].calFtop(None, txyz_, _traverse)
                    fm=(np.matrix([0.0,0.0,0.0]).T, np.matrix([0.0,0.0,0.0]).T)
                fm=self.J_L[j][1].calF(fm)
                n.append(fm[2].copy())
            p=p[::-1]    
            n=n[::-1]    
            for j in  self.nlist[::-1]:
                numJ[j, i]=(p[j]-n[j])/(2*delta) 
        self.forwardK(thetas)
        return  numJ        

    def forwardK(self, thetas=None):
        if thetas is not None:
            sp=thetas.shape
            for i in range(sp[0]):  self.thetas[i,0]=thetas[i, 0] 
            #for i in self.nlist:  self.thetas[i,0]=thetas[i, 0] 
        for i in self.nlist:
            jl=self.J_L[i]
            jl[0].update(self.thetas[i,0]) #joint 
            jl[1].update()  #Link
        self.tipPos= jl[1].Jm.DH()[:3,3]    
        return self.tipPos

    def draw(self):
        for i in self.nlist[:6]:#range(len(self.J_L)):
            jl=self.J_L[i]
            jl[1].draw()
    
    


if __name__=="__main__":        
    mm=1.0
    scale=0.1*mm
    colors=((1,0,0), (0,1,0.5), (0,0,1), (1,1,0), (1,0,1), (0,1,1))
    DHR=((2.0*mm, 0.0, 90*d2r, 1*scale, 0.0), 
        (0.0, 1.0*mm, 0.0, 1*scale, 0.0), 
        (0.0, 1.0*mm, 0.0*d2r, 0.7*scale, 0.0), 
        (0.0, 0.0, 90.0*d2r, 1*scale*0.5, 0.2*mm),
        (0.2*mm, 0.0, 90*d2r, 1*scale*0.3, 0.05*mm), 
        (0.05*mm, 0.1*mm, 90*d2r, 1*scale*0.2, None)
        )
    for n in App.listDocuments().keys():
        App.closeDocument(n)
    App.newDocument("Unnamed")
    App.setActiveDocument("Unnamed")
    App.ActiveDocument=App.getDocument("Unnamed")
    Gui.ActiveDocument=Gui.getDocument("Unnamed")
    v3d=Gui.activeView()
    balls=[]
    el=mB()
    pl=FreeCAD.Placement(FreeCAD.Vector(0.5, .0, 1.0), App.Rotation(90,0,90))
    el.Placement=pl
    Part.show(el)
    #Part.show(mycube) 
    robot=Robot(DHR, colors, balls)
    a=np.matrix([0, 0, 0, 0, 0, 0]).T
    b=np.matrix([90, 0, 0, 0, 0, 45]).T
    n=10
    robot.forwardK(a*d2r)
    robot.draw()
    rot=App.Rotation(0.21835882739022133, -0.004181207400355161, 0.04896189184057039, 0.9746305316133057)
    v3d.setCameraOrientation(rot)
    v3d.fitAll()
    for i in []:# range(n+1):
        c=a+(b-a)*i/float(n)
        robot.forwardK(c*d2r)
        robot.draw()
        Gui.updateGui()
        time.sleep(0.1)
    a=np.matrix([0.0, 10.0, -20.0, 0.0, 0.0, 0.0]).T
    s=robot.forwardK(a*d2r).copy()
    robot.draw()
    #temp,status=robot.SolvStatic(s)
    t=np.matrix([1.5, -0.5, 1.5]).T
    n=10
    for i in []:# range(n+1):
        c=s+(t-s)*i/float(n)
        temp,status=robot.SolvStatic(c)
        #robot.draw()
        #Gui.updateGui()
    #FreeCAD.ActiveDocument.recompute()


    
