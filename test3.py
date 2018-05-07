import numpy as np
from numpy import linalg as LA
from OpenGL.GL import *
from OpenGL.GLU import *
from wx import *
import time

#np.set_printoptions(precision=8, formatter={'float': '{: 10.3f}'.format}, suppress=True)
np.set_printoptions(linewidth=500)
np.set_printoptions(precision=5, suppress=True)
d2r=np.pi/180.0
r2d=1.0/d2r

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

class OBJ:
    def __init__(self, filenames, bxyzs):#bx=1.0, by=0, bz=1.5, scale=0.5):
        """Loads a Wavefront OBJ file. """
        self.vertices = []
        self.normals = []
        self.faces = []
        iii=0
        for filename in filenames:
            bx=bxyzs[iii][0]
            by=bxyzs[iii][1]
            bz=bxyzs[iii][2]
            scale=bxyzs[iii][3]
            iii+=1
            start_idx=len(self.vertices)
            for line in open(filename, "r"):
                if line.startswith('#'): continue
                values = line.split()
                if not values: continue
                if values[0] == 'v':
                    v = map(float, values[1:4])
                    v=np.matrix((bx+v[0]*scale, by+v[1]*scale, bz+v[2]*scale)).T
                    self.vertices.append(v)
                    self.normals.append(np.matrix(np.zeros((3,1))))
                elif values[0] == 'f':
                    face = []
                    norms = []
                    for v in values[1:]:
                        w = v.split('/')
                        face.append(int(w[0])+start_idx)
                    vs=[self.vertices[i-1] for i in face] 
                    v1=vs[1]-vs[0]
                    v2=vs[2]-vs[0]
                    #v1=np.matrix([(vs[1][i,0]-vs[0][i,0]) for i in range(3)]).T
                    #v2=np.matrix([(vs[2][i,0]-vs[0][i,0]) for i in range(3)]).T
                    nn=np.matrix(np.zeros((3,4)))
                    z=crossX(v1,v2)
                    z=z/np.sqrt(z.T*z)
                    x=v1/np.sqrt(v1.T*v1)
                    y=crossX(z,x)
                    pv=vs[0]
                    nn[:,0]=x
                    nn[:,1]=y
                    nn[:,2]=z
                    nn[:,3]=pv
                    v1_=nn[:,:3].T*v1
                    v2_=nn[:,:3].T*v2
                    self.faces.append((face, nn, [v1, v2]))
                    for i in face:
                        self.normals[i-1]=self.normals[i-1]+z
        self.normals=[v/np.sqrt(v.T*v) for v in self.normals]            
                    
    def createList(self):        
        self.gl_list = glGenLists(1)
        glNewList(self.gl_list, GL_COMPILE)
        glPushAttrib(GL_COLOR_BUFFER_BIT | GL_POLYGON_BIT)
        glColor3f(1.0, 1.0, 1.0)#, 0.8)
        glFrontFace(GL_CCW)
        glPolygonMode(GL_FRONT, GL_FILL);
        for face in self.faces:
            vertices, nn, temp= face
            glBegin(GL_TRIANGLES)
            glNormal3fv(nn[:,2])
            for i in range(len(vertices)):
                glVertex3fv(self.vertices[vertices[i] - 1])
            glEnd()
        glPolygonMode(GL_FRONT, GL_FILL);
        glPopAttrib()    
        glEndList()
        return self.gl_list

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

    def IM(self): return self.Im

class Link:
    def __init__(self, i, paras, work_, I=None, color=(1,1,1), last=False):
        self.name="link"+str(i)
        self.K=i
        self.last=last
        self.color=color
        self.m=1.0
        self.scaleK=0.000001
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
                temp=[np.matrix([[_a], [0], [self.d]]) for _a in np.linspace(0, self.a-0.5*self.a, 2)]
            self.da=self.da+temp[1:]
        self.update()
        self.pos=None
        self.work=work_
        self.numVertex=len(self.work.normals)
        self.numFaces=len(self.work.faces)
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
        
    def reset(self):
        self.dF_dT.fill(0.0)
        self.dM_dT.fill(0.0)
        self.Force1.fill(0.0)
        self.M1.fill(0.0)
        self.Force2.fill(0.0)
        self.M2.fill(0.0)
        self.F=0
        self.M=0


    def update(self):
        self.pos=self.Jm.update(self.rotx, self.da)
        self.geo.update(self.roty)
    
    def CheckNodes(self):
        #check if 
        flag=0
        scale=1.0
        if self.last==True: scale=0.0
        for i in range(self.numVertex):
            d_=self.work.vertices[i]-self.Jm.DH(3)#[:3,3]
            d=self.Jm.DH(3).T*d_
            dxy=np.sqrt(d[:2,0].T*d[:2,0])
            if dxy<self.r:
                if self.d>=0 and d[2,0]>self.r and d[2,0]<(self.d+self.r):
                    flag=1
                if self.d<0 and d[2,0]<self.r and d[2,0]>(self.d-self.r):
                    flag=1
                if flag!=0: break    
            d[2,0]-=self.d    
            dyz=np.sqrt(d[1:,0].T*d[1:,0])
            if dyz<self.r:
                if d[0,0]>self.r and d[0,0]<(self.a*(0.5+0.5*scale)+self.r*scale):
                    flag=1
                if flag!=0: break    
        if self.last==True: flag=0        
        return flag        

    def JM(self): return self.Jm    
    def GEO(self): return self.geo    

    def updateK(self, NK=1.0):
        self.scaleK*=NK


    def calFtop(self, robot, txyz_, normal_):
        StiffK=10.0
       #construct local CS
        nn=np.matrix(np.zeros((3,4)))
        z=normal_
        _x=np.matrix([1,0,0]).T
        x=crossX(_x, z)
        norm_=np.linalg.norm(x)
        if norm_ >0.1:
             x=x/norm_
        else:    
             _y=np.matrix([0,1,0]).T
             x=crossX(z, _y)
        y=crossX(z, x)     
        nn[:,0]=x
        nn[:,1]=y
        nn[:,2]=z
        nn[:,3]=np.matrix(txyz).T
        dxyz=nn[:,:3].T*(robot.tipPos-txyz)
        #attactive force to xyz
        self.F+=-StiffK*dxyz
        if robot is not None:
           for j in robot.nlist:
               self.dF_dT[:,j]-=robot.dR_dTheta[self.K*3:, j]*StiffK
        #contact force       
        for i in range(self.numFaces):
           _is=robot.work.faces[i][0] 
           m=robot.work.faces[i][1]
           _2v=robot.work.faces[i][2]
           vs=[robot.work.vertices[ii-1]-txyz for ii in _is]
           vs=[nn[:,:3].T*v for v in vs]
           if (vs[0][2]>=0 and v[1][2]>=0 and v[2][2]>=0) or (vs[0][2]<0 and vs[1][2]<0 and vs[2][2]<0):  continue
           #check if point in triangle 
           d=m[:,:3].T*(robot.tipPos-m[:,3])
           if d[2]-self.r>0: continue # if above XY plane
           u=_2v[0]
           v=_2v[1]
           uv=u[0]*v[1]
           #du=d[0]*u[1]-d[1]*u[0]  #u[1]=0
           du=-d[1]*u[0]
           dv=d[0]*v[1]-d[1]*v[0]  
           a=dv/uv
           b=du/uv
           if a<0 or b<0 or (a+b)>1: continue
           _d=-(d[2]-self.r)
           z=m[:,2]
           _f=_d**2.2*z*Coffs
           self.F+=_f
           if robot is not None:
                for j in robot.nlist:
                    dd=robot.dR_dTheta[self.K*3:, j]
                    self.dF_dT[:,j]+=-_d**(2.2-1)*dotX(z, dd)*z*Coffs
           break        

    def calF(self, FM, robot=None):
        StiffK=10.0
        Coffs=self.scaleK
        #if robot is not None:
	    #print 50*"X"+self.name
        self.F+=FM[0].copy()
        self.M+=FM[1].copy()
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
                    #self.dM_dT[:,j]+=crossX(L, self.dF_dT[:,j])
            for j in range(self.K+1):
                self.dM_dT[:,j]+=crossX(crossX(robot.e[:,j], L), self.F)
                self.dM_dT[:,j]+=crossX(L, self.dF_dT[:,j])
            dR_dtheta=(robot.dRg_dtheta, robot.dR_dtheta)
        VsIn1=[]
        a2=self.r*self.r
        a2_=1.1*a2
        ms=(self.geo, self.JM())
        temp=self.a
        if self.nd is None:
            temp*=0.5
        ad=(temp, self.nd)
        force=(self.Force1, self.Force2)
        moment=(self.M1, self.M2)
        for ii in [0,1]:
            visin=[]
            m=ms[ii]
            ez=m.DH()[:3,2]
            R=m.DH()[:3,3]
            L=m.relP()
            if ad[ii] is None: continue
            for i in range(self.numVertex):
                xi=self.work.vertices[i]
                ni=self.work.normals[i]
	        dr=Txm(xi, m)
                if dr[2,0]<-self.r or dr[2,0]>ad[ii]+self.r: continue
                rg=R-xi
                re=dotX(rg,ez)*ez
                r=rg-re
                r_n=dotX(r, ni)
                if r_n<0.0: continue
                #r_n=1
                visin.append(i)
                r2=dotX(r,r)
                Flg0=1.0/((r2-a2*0)*np.sqrt(r2))*r*Coffs
                if r2<a2_:
                    dta=a2_-r2
                    _F=dta*StiffK
                    Flg0+=_F
                    
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
                        dFlg=r_n*(b1*dotX(r,drv_dtheta)/np.sqrt(r2)*r+b2*drv_dtheta)+dr_n_dt*Flg0
                        if r2<a2_:
                            dFlg+=r_n*((-a2_/r2-1)*dotX(r,drv_dtheta)+dta/r2*drv_dtheta)*StiffK+dr_n_dt*_F

                        dFlg=dFlg*Coffs
                        self.dF_dT[:3,j]+=dFlg
                        self.dM_dT[:3,j]+=crossX(dL_dT-dre_dt, Flg)+crossX(L-re, dFlg)  
            self.F+=force[ii][:3,0]#self.Force2[:3,0]    
            self.M+=moment[ii][:3,0]#self.M2[:3,0]
            #if robot: print visin, ii
        self.rhs=dotX(e, self.M)
        if robot is not None:
            for j in robot.nlist:
                self.J[0,j]=dotX(robot.e[:,self.K],self.dM_dT[:,j])
                if j<self.K: self.J[0,j]+=dotX(crossX(robot.e[:,j], robot.e[:,self.K]),self.M)
        return (self.F, self.M, self.rhs)                   

    def twoCyn(self, c1, c2, d=0, nor=[0,0,1.0]):
        leng=len(c1)
        glBegin(GL_QUADS)
        for i in range(leng):
            ii=(i+1)%leng
            n=[c1[i][j]+c1[ii][j] for j in [0,1,2]]
            n[2]=n[2]-2*d
            nl=np.sqrt(n[0]*n[0]+n[1]*n[1]+n[2]*n[2])
            n=[v/nl for v in n]
            glNormal3fv(n)
            glVertex3fv(c1[i])
            glVertex3fv(c1[ii])
            glVertex3fv(c2[ii])
            glVertex3fv(c2[i])
        glEnd()        
        glBegin(GL_POLYGON)
        glNormal3fv([-v for v in nor])
        for v in c1: glVertex3fv(v)
        glEnd()        
        glBegin(GL_POLYGON)
        glNormal3fv([v for v in nor])
        for v in c2: glVertex3fv(v)
        glEnd()        

    def geoInfo(self):  
        _r=self.r
        scale=1.5
        sign=1.0
        if np.abs(self.d)>0.0: sign=self.d/np.abs(self.d) 
        self.calllist1=glGenLists(1)
        dcircle1=[(_r*np.cos(i), _r*np.sin(i), -_r*scale*sign) for i in np.linspace(0, 350, 35)*d2r]
        dcircle2=[(vs[0], vs[1], self.d+_r*scale*sign) for vs in dcircle1]
        glNewList(self.calllist1, GL_COMPILE)
        self.twoCyn(dcircle1, dcircle2)
        glEndList()
        if self.a>0.0:
            self.calllist2=glGenLists(1)
            acircle1=[(0.0, _r*np.cos(i), _r*np.sin(i)+self.d) for i in np.linspace(0, 350, 35)*d2r]
            acircle2=[(self.a, vs[1], vs[2]) for vs in acircle1]
            glNewList(self.calllist2, GL_COMPILE)
            self.twoCyn(acircle1, acircle2, self.d, [1.0, 0, 0])
            glEndList()
            
    def draw(self):
        m=self.Im
        if not self.init:
            self.geoInfo()
            self.init=True
        glPushMatrix()
        glPushAttrib(GL_COLOR_BUFFER_BIT | GL_POLYGON_BIT)
        glColor3fv(self.color)
        glMultMatrixf(self.Im.DH().flatten('F'))
        if self.calllist1 != None:
            glCallList(self.calllist1)
        if self.calllist2 != None:
            glCallList(self.calllist2)            
        glPopAttrib()    
        glPopMatrix()

class Robot:
    def __init__(self, DHR, work, colors):
        self.baseM=Marker()
        self.colors=colors
        self.work=work
        J=self.baseM
        self.J_L=[]
        i=0
        scale=[1,1,1,3,4,1]
        for dhr_ in DHR:
            I=Joint("J"+str(i), J)
            lnk=Link(i, dhr_, self.work, I.IM(), self.colors[i], i==len(DHR))
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
        self.J=np.matrix(np.zeros((3, nlink)))
        self.relP=np.matrix(np.zeros((3, nlink)))
        self.relG=np.matrix(np.zeros((3, nlink)))
        self.Jp=np.matrix(np.zeros((3*nlink, nlink)))
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

    def initialize(self, thetas):
        for i in self.nlist:  self.thetas[i,0]=thetas[i] 
        self.forwardK()
        
        
    def evalRhs_J(self, txyz=None, _normal=None):
        self.forwardK()
        if txyz is not None:
            if _normal is None:        
                self.rhs[6:,0]=self.tipPos-txyz
            else:    
                self.rhs[6,0]=dotX(_normal,  self.tipPos-txyz)
                self.rhs[7,0]=1.0
                self.rhs[8,0]=1.0
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
        if _normal is None:        
            self.J[6:9,:6]=self.dR_dtheta[i3:i3+3,:]        
            self.J[:6,6:9]=self.dR_dtheta[i3:i3+3,:].T
        else:    
            self.J[7,7]=1.0
            self.J[8,8]=1.0
            for i in self.nlist:
                self.J[6,i]=dotX(_normal, self.dR_dtheta[i3:i3+3,i])
                self.J[i,6]=self.J[6,i]#dotX(normal, self.dR_dtheta[i3:i3+3,:])
        if _normal is None:        
            FM=(self.thetas[6:,0], np.matrix([0.0,0.0,0.0]).T)
        else:    
            FM=(self.thetas[6,0]*_normal, np.matrix([0.0,0.0,0.0]).T)
        #FM=(np.matrix([0.0,0.0,0.0]).T, np.matrix([0.0,0.0,0.0]).T)
        tipLink=self.nlist[-1]
        self.dM.fill(0.0)
        self.dF.fill(0.0)
        for i in self.nlist[::-1]:
            link=self.J_L[i][1]
            link.reset(), 
            if _normal is not None and i == self.nlist[-1]:
                link.calFtop(self, txzy, normal)
            FMn=link.calF(FM, self)
            self.rhs[i,0]=FMn[2]
            self.J[i,:6]=link.J[0,:]
            FM=FMn
        return (self.J, self.rhs, 0)        


    def SolvStatic(self, txyz, normal=None, thetas=None):
        self.forwardK(thetas)
        tol=5.0e-5
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
        while converged==0:
            for i in range(9):
                self.thetas[i,0]=ori_states[i]
            factor*=0.75
            _thetas=[]
            i=0
            while i < 50:  
                _thetas.append(self.thetas.copy())
                J, rhs, flag=self.evalRhs_J(txyz, normal)
                #print LA.cond(J)
                maxj=np.amax(np.amax(np.absolute(J[6:,:])))
                maxJ=np.amax(np.amax(np.absolute(J[:6,:6])))
                hscale=maxJ/maxj
                J[:6,6:]*=hscale
                J[6:,:6]*=hscale
                rhs[6:,:]*=hscale
                DX=J.I*rhs*factor
                maxf=np.absolute(rhs[:6,0]).max()
                maxr=np.absolute(rhs[6:,0]).max()
                DX[6:,:] *= hscale
                i=i+1
                if (maxf<tolf and maxr<tol) and i>1:
                    converged=1
                    break
                self.thetas-=DX
            print maxf, maxr, factor, i, self.thetas[6:,0].T 
            iii+=1
            if factor<0.01:
                status=1
                print rhs.T
                break
        print LA.cond(J)
        return (_thetas, status)    
            
    
    def numDJ(self, thetas, txyz_=None, _normal=None):
        numJ=np.matrix(np.zeros((6,6)))    
        delta=0.00001
        numVar=len(thetas)
        for i in range(numVar):
            p=[]
            n=[]
            d=np.matrix([v for v in thetas]).T
            d[i,0]=d[i,0]+delta
            self.forwardK(d)
            fm=(self.rhs[6:], np.matrix([0.0,0.0,0.0]).T)
            fm=(np.matrix([1.0,1.0,1.0]).T, np.matrix([0.0,0.0,0.0]).T)
            if _normal is not None and i==6:
                fm=((self.rhs[6,0]+delta)*_normal, np.matrix([0.0,0.0,0.0]).T)
            for j in  self.nlist[::-1]:
                self.J_L[j][1].reset()
                if _normal is not None and j==self.nnlist[-1]:
                    self.J_L[j][1].calFtop(self, txzy_, _normal)
                fm=self.J_L[j][1].calF(fm)
                p.append(fm[2].copy())
            d[i,0]=d[i,0]-2*delta
            self.forwardK(d)
            fm=(self.rhs[6:], np.matrix([0.0,0.0,0.0]).T)
            fm=(np.matrix([1.0,1.0,1.0]).T, np.matrix([0.0,0.0,0.0]).T)
            if _normal is not None and i==6:
                fm=((self.rhs[6,0]-delta)*_normal, np.matrix([0.0,0.0,0.0]).T)
            for j in self.nlist[::-1]:
                self.J_L[j][1].reset()
                if _normal is not None and j==self.nnlist[-1]:
                    self.J_L[j][1].calFtop(self, txzy_, _normal)
                fm=self.J_L[j][1].calF(fm)
                n.append(fm[2].copy())
            d[i,0]=d[i,0]+delta
            self.forwardK(d)
            p=p[::-1]    
            n=n[::-1]    
            for j in  self.nlist[::-1]:
                numJ[j, i]=(p[j]-n[j])/(2*delta) 
        return  numJ        

    def forwardK(self, thetas=None):
        if thetas is not None:
            for i in self.nlist:  self.thetas[i,0]=thetas[i, 0] 
        for i in self.nlist:
            jl=self.J_L[i]
            jl[0].update(self.thetas[i,0]) #joint 
            jl[1].update()  #Link
        self.tipPos= jl[1].Jm.DH()[:3,3]    
        return self.tipPos

    def draw(self):
        for i in self.nlist:#range(len(self.J_L)):
            jl=self.J_L[i]
            jl[1].draw()

class RobotDrawingBoard(glcanvas.GLCanvas):
    def __init__(self, parent, robot_, work_=None):
        glcanvas.GLCanvas.__init__(self, parent, -1, style=wx.WANTS_CHARS)
        self.robot=robot_
        self.work=work_
        self.minx=-5
        self.maxx=5
        self.miny=-5
        self.maxy=5
        self.minz=-5
        self.maxz=5
        self.keychar=None
        self.Bind(wx.EVT_LEFT_DCLICK, self.OnDclick)
        self.Bind(wx.EVT_MOUSEWHEEL, self.OnMouseWheel)
        self.Bind(wx.EVT_KEY_DOWN, self.onKeyPress)
        self.Bind(wx.EVT_KEY_UP, self.onKeyPressUp)
        self.Bind(wx.EVT_PAINT, self.OnPaint)
        self.init=False
        
    def InitGL(self):
        self.ViewControl()
        glMatrixMode(GL_MODELVIEW)
        glRotate(-90, 1,0,0)
        glEnable(GL_DEPTH_TEST)
        glEnable(GL_LIGHTING)
        glEnable(GL_LIGHT0)
        glEnable (GL_COLOR_MATERIAL )
        glEnable(GL_NORMALIZE)
        glLightModelfv(GL_LIGHT_MODEL_AMBIENT, [0.8, 0.8, 0.8, 1.0])
        glLightfv(GL_LIGHT0, GL_DIFFUSE, [0.5, 0.5, 0.5, 1.0])
        glLightfv(GL_LIGHT0, GL_POSITION, [5,-5, 5])
        glPolygonMode(GL_FRONT, GL_FILL)
        #glEnable(GL_PROGRAM_POINT_SIZE_EXT)
        glPointSize(10)
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)

        self.axes=glGenLists(1)
        glNewList(self.axes, GL_COMPILE)
        glBegin(GL_LINES)
        glColor3f(1.0, 1.0, 1.0)
        glVertex3f(0,0,0)
        glVertex3f(1,0,0)
        glColor3f(0.0,1.0,0.0)
        glVertex3f(0,0,0)
        glVertex3f(0,1,0)
        glColor3f(0.0, 0.0, 1.0)
        glVertex3f(0,0,0)
        glVertex3fv((0,0,1))
        glEnd() 
        glEndList()
        self.wklist=self.work.createList()
        #self.OnDraw()
    def onKeyPressUp(self, evt):
        self.keychar=None
        evt.Skip()
    def onKeyPress(self, evt):
        keycode=evt.GetKeyCode()
        if keycode<256:
            char = chr(keycode).lower()
            if char=='x' or char=='y' or char=='z': 
                self.keychar=char
        else:
            char=keycode
            if char==wx.WXK_UP or char==wx.WXK_DOWN or char==wx.WXK_LEFT or char==wx.WXK_RIGHT or char==wx.WXK_HOME:
                self.keychar=char
                self.ViewControl()  
                self.OnPaint(evt)
#                self.Refresh()
                self.Update()
        evt.Skip()
    
    def OnMouseWheel(self, evt):    
        rot=evt.GetWheelRotation()
        self.pn=rot/120
        dx=0.1
        dy=0.1
        if self.keychar==None:     
            self.minx=self.minx-dx*self.pn
            self.maxx=self.maxx+dx*self.pn
            self.miny=self.miny-dy*self.pn
            self.maxy=self.maxy+dy*self.pn
        self.ViewControl()  
        self.OnPaint(evt)
#        self.Refresh()
        self.Update()
        evt.Skip()
    def ViewControl(self):
        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        disp=-0.1
        if self.keychar==wx.WXK_UP:
            self.miny=self.miny+disp
            self.maxy=self.maxy+disp
        elif self.keychar==wx.WXK_DOWN:  
            self.miny=self.miny-disp
            self.maxy=self.maxy-disp            
        elif self.keychar==wx.WXK_LEFT:
            self.minx=self.minx-disp
            self.maxx=self.maxx-disp            
        elif self.keychar==wx.WXK_RIGHT:
            self.minx=self.minx+disp
            self.maxx=self.maxx+disp                  
        glOrtho(self.minx, self.maxx, self.miny, self.maxy, self.minz, self.maxz) 
        glMatrixMode(GL_MODELVIEW)
        if self.keychar == 'x' or self.keychar == 'y'  or self.keychar == 'z':            
            prem=glGetFloat(GL_MODELVIEW_MATRIX)
            glLoadIdentity()
            delta=-5
            if self.keychar=='x':
                glRotate(delta*self.pn, 1,0,0)
            elif  self.keychar=='y':  
                glRotate(-delta*self.pn, 0,1,0)
            else:
                glRotate(delta*self.pn, 0,0,1)
            glMultMatrixf(prem)   
        elif self.keychar==wx.WXK_HOME:
            glLoadIdentity()

    def OnPaint(self, evt):
        self.SetCurrent()
        if not self.init:
            self.InitGL()
            self.init = True
        self.OnDraw()
        evt.Skip()

    def OnDclick(self, evt):
        pos=evt.GetPosition()
        glMatrixMode(GL_PROJECTION)
        projection = glGetFloatv ( GL_PROJECTION_MATRIX ) 
        glLoadIdentity()
        glInitNames()
        gluPickMatrix(pos.x, pos.y, 2, 2, glGetIntegerv(GL_VIEWPORT))
        glMultMatrixd(projection)
        glSelectBuffer(512)

        glMatrixMode(GL_MODELVIEW)
        #self.OnDraw()
        hits=glRenderMode(GL_SELECT)
        print hits
        evt.Skip()



    def OnDraw(self):
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glCallList(self.axes)
        glCallList(self.wklist)
        self.robot.draw()
        self.SwapBuffers()
#        
    def OnSize(self, event):
        wx.CallAfter(self.DoSetViewport)
        event.Skip()
    def DoSetViewport(self):
        if self.IsShown():
            self.SetCurrent()
            size = self.size = self.GetClientSize()
            glMatrixMode(GL_PROJECTION)
            glViewport(0, 0, size.width, size.height)
            glMatrixMode(GL_MODELVIEW)

class MainWindow(wx.Frame):
    def __init__(self, parent = None,id = -1, title = "Syringa Robotics Inc."):        
        wx.Frame.__init__(
                self, parent, id, title, size = (1000,800),
                style = wx.DEFAULT_FRAME_STYLE #| wx.NO_FULL_REPAINT_ON_RESIZE
        )
        scale=0.1
        colors=((1,0,0), (0,1,0.5), (0,0,1), (1,1,0), (1,0,1), (0,1,1))
        DHR=((2.0, 0.0, 90*d2r, 1*scale, 0.0), 
                (0.0, 1.0, 0.0, 1*scale, 0.0), 
                (0.0, 1.0, 0.0*d2r, 0.7*scale, 0.0), 
                (0.0, 0.0, 90.0*d2r, 1*scale*0.5, 0.2),
                (0.2, 0.0, 90*d2r, 1*scale*0.3, 0.05), 
                (0.05, 0.10, 90*d2r, 1*scale*0.2, None)
                )
        #self.w_ork=OBJ("dodecahedron.obj")
        self.bx=1.0
        self.by=0.0
        self.bz=1.5
        self.R=0.4
        objs=("ball.obj", "ball.obj", "ball.obj")
        self.bxyzs=((0.8, -0.6, 1.0, 0.4), (0.8, 0.6, 1.0, 0.4), (1.7, 0, 1.5, 0.4))
        self.w_ork=OBJ(objs[:], self.bxyzs[:])
        #self.w_ork=OBJ("knot.obj", self.bx, self.by, self.bz, self.R)
        self.robot=Robot(DHR, self.w_ork, colors[:6])
        self.robot.forwardK(np.matrix([0,0,0, 0,0,0]).T)
        self.glwin=RobotDrawingBoard(self, self.robot, self.w_ork)
        box = wx.BoxSizer(wx.HORIZONTAL)
        box.Add(self.glwin, 1, wx.ALIGN_CENTRE|wx.ALL|wx.EXPAND, 5)
        self.SetSizer(box)    
        self.SetAutoLayout(True)
        self.Layout()
        self.CreateStatusBar()
        menubar = wx.MenuBar()
         
        filemenu = wx.Menu()
        menuitem = filemenu.Append(wx.ID_EXIT, "E&xit", "Terminate the program")
        self.Bind(wx.EVT_MENU, self.OnExit, id=wx.ID_EXIT) # here comes the event-handler
        menubar.Append(filemenu,"&File")
       
        actids=[]
        actionmenu=wx.Menu()
        for i in range(5):actids.append(wx.NewId())
        actionmenu.Append(actids[0], "Home", "Initial Posiition")
        self.Bind(wx.EVT_MENU, self.OnHome, id=actids[0])
        actionmenu.Append(actids[1], "Motion", "Motion")
        self.Bind(wx.EVT_MENU, self.OnMotion, id=actids[1])
        actionmenu.Append(actids[2], "PathFollow", "PathFollow")
        self.Bind(wx.EVT_MENU, self.OnPathFollow, id=actids[2])
        actionmenu.Append(actids[3], "Traversal", "Traversal")
        self.Bind(wx.EVT_MENU, self.OnTraversal, id=actids[3])
        actionmenu.Append(actids[4], "Replay", "Replay")
        self.Bind(wx.EVT_MENU, self.OnReplay, id=actids[4])
        menubar.Append(actionmenu,"&Actions")
        self.animation=[]
        self.SetMenuBar(menubar)
        self.Show(True)
        
    def OnExit(self,evt):
        self.Close()
        evt.Skip()

    def OnTraversal(self, evt):
        self.animation=[]
        a=np.matrix([-0*d2r, 10*d2r, -10*d2r, 0, 0, 0*d2r]).T
        s=self.robot.forwardK(a).copy()
        temp,status=self.robot.SolvStatic(s)
        v=s.copy()
        v[0,0]=0.8
        v[1,0]=0.0
        v[2,0]=0.0

        num=20
        delta=(v-s)/float(num)
        normal=delta/LA.norm(delta)
        print normal
        #for ii in range(1, 2):
        #    val=s+delta*ii
        #    self.robot.SolvStatic(val, normal)
        #    self.glwin.OnDraw()

    def OnPathFollow(self, evt):
        self.animation=[]
        a=[-15*d2r, 0, 0, 0, 0, 0*d2r]
        a=[-25*d2r, 25*d2r, -25*d2r, -0*d2r, 0*d2r, 0*d2r]
        a=[-25*d2r, 25*d2r, -25*d2r, 0*d2r, 90*d2r, 90*d2r]
        s=self.robot.forwardK(np.matrix(a).T).copy()
        temp,status=self.robot.SolvStatic(s)
        self.glwin.OnDraw()
        if status!=0: 
            for t in temp:
                self.animation.append(t)
            return
        vv=[]
        num=[10, 20, 10]
        for bxyz in self.bxyzs[:2]:
            vv.append((bxyz[0]+self.R+0.001, bxyz[1], bxyz[2]))
	bxyz=self.bxyzs[2]    
        vv.append((bxyz[0], bxyz[1]+self.R+0.001, bxyz[2]))
	for ang in np.linspace(90, 270, 30)*d2r:
		v=(bxyz[0]+self.R*np.cos(ang), bxyz[1]+self.R*np.sin(ang), bxyz[2])
		vv.append(v)
		num.append(1)
	    
        iii=0    
	jj=0
        for v in vv[:]: 
            e=np.matrix(v).T
            e=e.copy()
	    _num=num[jj]
	    jj+=1
            delta=(e-s)/float(_num)
            for ii in range(_num):
                val=s+delta*(ii+1)
                thetas, status=self.robot.SolvStatic(val)
                print iii
                iii=iii+1
                self.glwin.OnDraw()
                self.animation.append(thetas[-1].copy())
                if status!=0: 
                    for t in thetas:
                        self.animation.append(t.copy())
                    return
            s=e.copy()    
            #num=1
        print "finish"    
        
    def OnReplay(self, evt):
        for ani in self.animation:
            self.robot.forwardK(ani)
            self.glwin.OnDraw()
            time.sleep(0.05)

    def OnMotion(self, evt):
        for i in np.linspace(-1, 1, 100)*d2r:
            a=[i*45, i*45, i*45, 90*d2r+i*120, i*120, i*0]
            self.robot.forwardK(np.matrix(a).T)
            df=self.robot.evalRhs_J()[0]    
            dfn=self.robot.numDJ(a)
            self.glwin.OnDraw()
            print df[:6,:6]
            print dfn
            print df[:6,:6]-dfn
                     
    def OnHome(self, evt):                 
        a=[0, 0, 0, 0*45*d2r+0, 0*45*d2r, 0*d2r]
        a=[-25*d2r, 25*d2r, -25*d2r, 0*d2r, 90*d2r, 90*d2r]
        self.robot.forwardK(np.matrix(a).T)
        #df=self.robot.evalRhs_J()[0]    
        #dfn=self.robot.numDJ(a)
        self.glwin.OnDraw()
        #print df[:6,:6]
        #print dfn
        #print df[:6,:6]-dfn
#if __name__=="__main__":
#    DHR=((1, 0, 90*d2r, 1*0.2), (0, 1.0, 0.0, 1*0.2), (0, 1.0, 0.0, 1*0.2))
#    robot=Robot(DHR)
#    robot.forwardK([0*d2r, 30*d2r, -30*d2r])
if __name__=="__main__":        
    app = wx.App()
    frame = MainWindow()
    app.MainLoop()
    del frame
    del app    
