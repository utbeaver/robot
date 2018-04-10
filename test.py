import numpy as np
from numpy import linalg as LA
from OpenGL.GL import *
from wx import *
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
    def __init__(self, filename, bx=1.0, by=0, bz=1.5, scale=0.2):
        """Loads a Wavefront OBJ file. """
        self.vertices = []
        self.normals = []
        self.faces = []
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
                    face.append(int(w[0]))
                vs=[self.vertices[i-1] for i in face] 
                v1=np.matrix([(vs[1][i,0]-vs[0][i,0]) for i in range(3)]).T
                v2=np.matrix([(vs[2][i,0]-vs[0][i,0]) for i in range(3)]).T
                n=crossX(v1,v2)
                n=n/np.sqrt(n.T*n)
                self.faces.append((face, n))
                for i in face:
                    self.normals[i-1]=self.normals[i-1]+n
        self.normals=[v/np.sqrt(v.T*v) for v in self.normals]            
                    
    def createList(self):        
        self.gl_list = glGenLists(1)
        glNewList(self.gl_list, GL_COMPILE)
        glFrontFace(GL_CCW)
        glPolygonMode(GL_FRONT, GL_FILL);
        for face in self.faces:
            vertices, normals= face
            glBegin(GL_POLYGON)
            glNormal3fv(normals)
            for i in range(len(vertices)):
                glVertex3fv(self.vertices[vertices[i] - 1])
            glEnd()
        glPolygonMode(GL_FRONT, GL_FILL);
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
        self.scaleK=0.5
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
        self.numMesh=len(self.da)
        self.Force1=np.matrix(np.zeros((3,1)))
        self.M1=np.matrix(np.zeros((3,1)))
        self.Force2=np.matrix(np.zeros((3,1)))
        self.dF_dT=np.matrix(np.zeros((3, 6)))
        self.dM_dT=np.matrix(np.zeros((3, 6)))
        self.F=np.matrix([0.0,0.0,0.0]).T
        self.M=np.matrix([0.0,0.0,0.0]).T
        self.J=np.matrix(np.zeros((1, 6)))
        self.flag=(1==0)
        
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
        self.scaleK=NK

    def calF(self, FM, flag=False, robot=None):
        Coffs=1.0
	print 50*"X"+self.name
        self.F=FM[0].copy()
        self.M=FM[1].copy()
        imp=self.Im.DH()[:3,3]
        impg=self.geo.DH()[:3,3]
        e=self.Im.DH(3)[:,2]
        L=self.JM().relP()
        Lg=self.GEO().relP()
        self.dF_dT.fill(0.0)
        self.dM_dT.fill(0.0)
        self.Force1.fill(0.0)
        self.M1.fill(0.0)
        self.Force2.fill(0.0)
        self.M+=crossX(L, self.F)
        if robot is not None:
            if self.K<robot.nlist[-1]:  #if not the last link, get the J from upper one
                for j in robot.nlist:
                    self.dF_dT[:,j]+=robot.J_L[self.K+1][1].dF_dT[:,j]
                    self.dM_dT[:,j]+=robot.J_L[self.K+1][1].dM_dT[:,j]
                    self.dM_dT[:,j]+=crossX(L, self.dF_dT[:,j])
            for j in range(self.K+1):
                self.dM_dT[:,j]+=crossX(crossX(robot.e[:,j], L), self.F)
        VsIn1=[]
        rr=self.r*self.r
        if self.nd is not None:
            for i in range(self.numVertex):
	        dr=Txm(self.work.vertices[i], self.Jm)
                if dr[2,0]<-self.r or dr[2,0]>self.nd+self.r: continue
                VsIn1.append(i)
        #print VsIn1, "VsIn1"         
        VsIn2=[]
        ez=self.geo.DH()[:3,2]
        R=self.geo.DH()[:3,3]
        for i in range(self.numVertex):
            xi=self.work.vertices[i]
            ni=self.work.normals[i]
	    dr=Txm(xi, self.geo)
            if dr[2,0]<-self.r or dr[2,0]>self.a+self.r: continue
            rg=R-xi
            re=dotX(rg,ez)*ez
            r=rg-re
            r2=dotX(r,r)
            a2=self.r*self.r
            Flg=1.0/((r2-a2)*np.sqrt(r2))*r*Coffs
            self.Force1[:3,0]+=Flg
            self.M1[:3,0]+=crossX(Lg-re, Flg)
            VsIn2.append(i)
            if robot is not None:
                dRg_dtheta=robot.dRg_dtheta[self.K*3:self.K*3+3,:]
                b2=1/((r2-a2)*np.sqrt(r2))
                b1=b2*b2*(a2-3*r2)
                for j in range(self.K+1):
                    dez_dT=crossX(robot.e[:,j],ez)
                    dLg_dT=crossX(robot.e[:,j], Lg)
                    dRg_dt=dRg_dtheta[:,j]
                    dre_dt=dotX(dRg_dt, ez)*ez+dotX(rg,dez_dT)*ez+dotX(rg,ez)*dez_dT
                    drv_dtheta=dRg_dt-dre_dt
                    dFlg=b1*dotX(r,drv_dtheta)/np.sqrt(r2)*r+b2*drv_dtheta
                    dFlg=dFlg*Coffs
                    self.dF_dT[:3,j]+=dFlg
                    self.dM_dT[:3,j]+=crossX(dLg_dT-dre_dt, Flg)+crossX(Lg-re, dFlg)  
        self.F+=self.Force1[:3,0]    
        self.M+=self.M1[:3,0]
        #print VsIn2, "VsIn2"         
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
        for dhr_ in DHR:
            I=Joint("J"+str(i), J)
            lnk=Link(i, dhr_, self.work, I.IM(), self.colors[i-1], i==len(DHR))
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

    def initialize(self, thetas):
        for i in self.nlist:  self.thetas[i,0]=thetas[i] 
        self.forwardK()
        
        
    def updateK(self, NK):
        for i in self.nlist:
            link=self.J_L[i][1]
            link.updateK(NK)

    def evalRhs_J(self, txyz=None):
        xyz0=self.forwardK()
        if txyz is not None:
            self.rhs[6:,0]=xyz0-txyz
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
        #for i in self.nlist:
        #    i3=i*3
        #    print self.dR_dtheta[i3:i3+3,:]
        #    print self.dRg_dtheta[i3:i3+3,:]        
        #    print 50*"X"
        self.J[6:9,:6]=self.dR_dtheta[i3:i3+3,:]        
        self.J[:6,6:9]=self.dR_dtheta[i3:i3+3,:].T
        FM=(np.matrix([100.0,100.0,100.0]).T, np.matrix([0.0,0.0,0.0]).T)
        FM=(self.thetas[6:,0], np.matrix([0.0,0.0,0.0]).T)
        tipLink=self.nlist[-1]
        self.dM.fill(0.0)
        self.dF.fill(0.0)
        for i in self.nlist[::-1]:
            link=self.J_L[i][1]
            FMn=link.calF(FM, i==-1, self)
            self.rhs[i,0]=FMn[2]
            self.J[i,:6]=link.J[0,:]
            FM=FMn
        print self.J[:6,:6]
        print self.e
        #for i in self.nlist[::-1]:
        #    i3=i*3
        #    i33=i3+3
        #    link=self.J_L[i][1]
        #    flag=link.CheckNodes()
        #    if flag!=0:
        #        print flag, i
        #        break
        #    imp=link.Im.DH()[:3,3]
        #    FMn=link.calF(FM, i==1, self)
        #    self.rhs[i,0]=FMn[2]
        #    if i<tipLink:
        #        for j in self.nlist:
        #            self.dF[i3:i33,j]+=self.dF[i33:i33+3,j]
        #            self.dM[i3:i33,j]+=self.dM[i33:i33+3,j]+crossX(self.relP[:,i], self.dF[i33:i33+3,j])
        #    for j in range(i+1):
        #        dL=crossX(self.e[:,j], self.relP[:,i])
        #        self.dM[i3:i33,j]+=crossX(dL, FM[0])
        #    for k in range(link.numMesh):
        #        k3=3*k
        #        k33=k3+3
        #        pos_imp=link.pos[k]-imp
        #        for j in range(i+1):
        #            df=link.dF_dT[:,k3:k33]*crossX(self.e[:,j], pos_imp)
        #            if j<i:
        #                df+=link.dF_dT[:,k3:k33]*(self.dR_dtheta[i3-3:i3,j])
        #            dl=crossX(self.e[:,j], pos_imp)
        #            self.dM[i3:i33,j]+=crossX(dl, link.Force[:,k])
        #            self.dM[i3:i33,j]+=crossX(pos_imp, df)#self.dF[i3:i33,j])    
        #            self.dF[i3:i33,j]+=df#link.dF_dT[:,k3:k33]*crossX(self.e[:,j], pos_imp)
        #    for j in self.nlist:
        #        self.J[i,j]=self.e[:,i].T*self.dM[i3:i33,j]
        #        if j<i: self.J[i,j]+=crossX(self.e[:,j], self.e[:,i]).T*FMn[1]
        #    FM=FMn    

        return (self.J, self.rhs, 1)        

    def SolvStatic(self, txyz, thetas=None):
        self.forwardK(thetas)
        tol=1.0e-4
        maxr=1.0e10
        factor=1.0/0.75
        converged=0
        ori_states=[self.thetas[i,0] for i in range(9)]
        flag=0
        _1d=np.pi/180.0
        hscale=50
        while converged==0:
            flag=0
            for i in range(9):
                self.thetas[i,0]=ori_states[i]
            factor*=0.75
            i=0
            while i < 25:  
                factor=1.0
                print self.thetas.T, "theta"
                self.updateK(100)
                J, rhs, flag=self.evalRhs_J(txyz)
                maxj=np.amax(np.amax(np.absolute(J[6:,:])))
                hscale=J[0,0]/maxj
                J[:, 6:]*=hscale
                J[6:, :]*=hscale
                rhs[6:,0]*=hscale
                #print LA.cond(J)
                if flag == 1:
                    break
                DX=J.I*rhs
                DX[:6,0]=DX[:6,0]*factor    
                iX[6:,0]=DX[6:,0]*hscale    
                DX[6:,0]=DX[6:,0]*factor    
                maxv=np.absolute(DX[:6,0]).max()
                scale=1.0
                if maxv>_1d:
                    scale=_1d/maxv
                #print scale, _1d, maxv
                DX[:,0]=DX[:,0]*scale    
                maxr=np.absolute(rhs[6:,0]).max()/hscale
                self.thetas[:,0]-=DX[:,0]
                i=i+1
                if maxr<tol and i>1:
                    converged=1
                    break
                if factor <0.01: facctor=2.0/0.75    
            if flag==0: print maxv, maxr, factor, i 
        return self.thetas+DX    
            
        
        
    
    def numDJ(self, thetas):
        numJ=np.matrix(np.zeros((6,6)))    
        delta=0.00001
        for i in range(6):
            p=[]
            n=[]
            d=np.matrix([v for v in thetas]).T
            d[i,0]=d[i,0]+delta
            self.forwardK(d)
            fm=(self.rhs[6:], np.matrix([0.0,0.0,0.0]).T)
            #fm=(np.matrix([100.0,100.0,100.0]).T, np.matrix([0.0,0.0,0.0]).T)
            for j in  self.nlist[::-1]:
                fm=self.J_L[j][1].calF(fm)
                p.append(fm[2].copy())
            d[i,0]=d[i,0]-2*delta
            self.forwardK(d)
            fm=(self.rhs[6:], np.matrix([0.0,0.0,0.0]).T)
            #fm=(np.matrix([100.0,100.0,100.0]).T, np.matrix([0.0,0.0,0.0]).T)
            for j in self.nlist[::-1]:
                fm=self.J_L[j][1].calF(fm)
                n.append(fm[2].copy())
            d[i,0]=d[i,0]+delta
            self.forwardK(d)
            p=p[::-1]    
            n=n[::-1]    
            for j in  self.nlist[::-1]:
                numJ[j, i]=(p[j]-n[j])/(2*delta) 
        return  numJ        

    def numDF(self, thetas):
        dFN=np.matrix(np.zeros((3*6, 6)))
        delta=0.00001
        for i in range(6):
            p=[]
            n=[]
            d=[v for v in thetas]
            d[i]=d[i]+delta
            self.forwardK(d)
            fm=(self.rhs[6:], np.matrix([0.0,0.0,0.0]).T)
            #fm=(np.matrix([1.0,1.0,1.0]).T, np.matrix([0.0,0.0,0.0]).T)
            for j in  self.nlist[::-1]:
                fm=self.J_L[j][1].calF(fm)
                p.append(fm[0].copy())
            d[i]=d[i]-2*delta
            self.forwardK(d)
            fm=(self.rhs[6:], np.matrix([0.0,0.0,0.0]).T)
            #fm=(np.matrix([1.0,1.0,1.0]).T, np.matrix([0.0,0.0,0.0]).T)
            for j in self.nlist[::-1]:
                fm=self.J_L[j][1].calF(fm)
                n.append(fm[0].copy())
            self.forwardK(thetas)
            p=p[::-1]    
            n=n[::-1]    
            for j in  self.nlist[::-1]:
                dFN[j*3:j*3+3, i]=(p[j]-n[j])/(2*delta) 
        return dFN
            
    def forwardK(self, thetas=None):
        if thetas is not None:
            for i in self.nlist:  self.thetas[i,0]=thetas[i, 0] 
        for i in self.nlist:
            jl=self.J_L[i]
            jl[0].update(self.thetas[i,0]) #joint 
            jl[1].update()  #Link
        return jl[1].Jm.DH()[:3,3]    
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
#        self.Bind(wx.EVT_SIZE, self.OnSize)
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
                glRotate(delta*self.pn, 0,1,0)
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
        DHR=((2.0, 0.0, 90*d2r, 1*scale, 0.2), 
                (0.2, 1.0, 0.0, 1*scale, 0.2), 
                (0.2, 1.0, 0.0*d2r, 1*scale, 0.2), 
                (0.2, 0.0, 90.0*d2r, 1*scale*0.5, 0.4),
                (0.4, 0.0, 90*d2r, 1*scale*0.5, 0.1), 
                (0.1, 0.2, 90*d2r, 1*scale*0.2, None)
                )
        self.w_ork=OBJ("dodecahedron.obj")
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
        for i in range(4):actids.append(wx.NewId())
        actionmenu.Append(actids[0], "Home", "Initial Posiition")
        self.Bind(wx.EVT_MENU, self.OnHome, id=actids[0])
        actionmenu.Append(actids[1], "Motion", "Motion")
        self.Bind(wx.EVT_MENU, self.OnMotion, id=actids[1])
        actionmenu.Append(actids[2], "Static", "Static")
        self.Bind(wx.EVT_MENU, self.OnStatic, id=actids[2])
        actionmenu.Append(actids[3], "Replay", "Replay")
        self.Bind(wx.EVT_MENU, self.OnReplay, id=actids[3])
        menubar.Append(actionmenu,"&Actions")
        self.animation=[]
        self.SetMenuBar(menubar)
        self.Show(True)
        
    def OnExit(self,evt):
        self.Close()
        evt.Skip()

    def OnStatic(self, evt):
        self.animation=[]
        a=[0, 0, 0, 0, 0, 0]
        a=[0, 25*d2r, -25*d2r, 0*d2r+0, 0*d2r, 90*d2r]
        s=self.robot.forwardK(np.matrix(a).T).copy()
        self.robot.SolvStatic(s)
        self.glwin.OnDraw()
        vv=((1.8, 0.1, 2.0), (1.7, 0.2, 1.6), (1.5, 0.4, 1.5), (1.8, 0.1, 1.42))
        vv=(self.w_ork.vertices[1], self.w_ork.vertices[18], self.w_ork.vertices[2],  self.w_ork.vertices[1])  #last idx from 17
        iii=0
        num=25
        for v in vv[:1]: 
            e=np.matrix(v).T
            e=v.copy()
            delta=(e-s)/float(num)
            for ii in range(num+1):
                val=s+delta*ii
                thetas=self.robot.SolvStatic(val)
                self.glwin.OnDraw()
                self.animation.append(thetas)
            s=e.copy()    
        print "finish"    
        
    def OnReplay(self, evt):
        for ani in self.animation:
            self.robot.forwardK(ani)
            self.glwin.OnDraw()

    def OnMotion(self, evt):
        for i in np.linspace(-1, 1, 100)*d2r:
            a=[i*45, i*45, i*45, 90*d2r+i*120, i*120, i*0]
            self.robot.forwardK(np.matrix(a).T)
            df=self.robot.evalRhs_J()[0]    
            #dfn=self.robot.numDF(a)
            dfn=self.robot.numDJ(a)
            self.glwin.OnDraw()
            print df[:6,:6]
            print dfn
            print df[:6,:6]-dfn
                     
    def OnHome(self, evt):                 
        a=[0, 0, 0, 0*45*d2r+0, 0*45*d2r, 0*45*d2r]
        self.robot.forwardK(np.matrix(a).T)
        df=self.robot.evalRhs_J()[0]    
        #dfn=self.robot.numDF(a)
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
