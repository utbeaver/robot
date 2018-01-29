from motionclass import *
from parautility import *
import numpy as np
import os
import matplotlib.pyplot as plt
d2r=np.pi/180

def Sprocket_profile(R, N, xyz=(0,0,0)):
    alpha=2*np.pi/N
    L=2*R*np.sin(alpha/2)
    r=L/3.0
    xy_=[]
    for i in np.linspace(90, 270, 5)*d2r:
        xy_.append([R+r*np.cos(i), r*np.sin(i)])
    xy_.reverse()    
    xy=[]
    xyr=[]
    for i in range(N):
        ang=alpha*i
        cs=np.cos(ang)
        ss=np.sin(ang)
        for v in xy_:
            x=v[0]*cs-v[1]*ss+xyz[0]
            y=v[0]*ss+v[1]*cs+xyz[1]
            xy.append((x,y))    
        xyr.append(((R-r)*cs+xyz[0], (R-r)*ss+xyz[1]))    
    return (xy, xyr, r, L)        

def Sprocket(part, name_, R, N, baeline, T, p, mar_):
    (xy, xyr, r, L)=Sprocket_profile(R,N)
    xy=[(i[0]+p[0], i[1]+p[1]) for i in xy]
    xyr=[(i[0]+p[0], i[1]+p[1]) for i in xyr]
    mar=Marker(part, "sprocket_%s_mar"%name_, ref=mar_)
    Extrusion(part, name_+"1", xyr, baeline, T/10, "RED", mar) 
    Extrusion(part, name_+"2", xy, baeline+T/10, T/10*8, "RED", mar) 
    Extrusion(part, name_+"3", xyr, baeline+T/10*9, T/10, "RED", mar) 
    return (mar, r, L)

def Sprocket_Pair(pairname, R, N, par1, par2, par3, p1, p2, bline, T, refmar, left=1, right=1):
    dp1=p2[1]-p1[1]
    dp0=p2[0]-p1[0]
    alpha=np.arctan2(dp1, dp0)/d2r
    LL=np.sqrt(dp1*dp1+dp0*dp0)
    cs=np.cos(alpha)
    ss=np.sin(alpha)
    ref_mar=Marker(par3, "%s_chain_pair_mar"%pairname, Z(p1, 0), (0,0, alpha), ref=refmar) 
    (marl, r, L)=Sprocket(par1, "%s_left"%pairname, R, N, bline, T, (0,0,0),  ref_mar)
    (marr, r, L)=Sprocket(par2, "%s_right"%pairname, R, N, bline, T, (LL,0,0),  ref_mar)
    pnts=[(r*np.cos(i), r*np.sin(i)) for i in np.linspace(0, 330, 11)*d2r]
    Joint(par1.parent(), "%s_parallel"%pairname, marl, marr, "orientation", _jprim=1)
    if left==1: createJ(par1.parent(), "%s_left"%pairname, par1, par3, Z(p1, bline), (0,0,0), refmar)
    if right==1: createJ(par2.parent(), "%s_right"%pairname, par2, par3, Z(p2, bline), (0,0,0), refmar)

    pnt_=[(R+r*np.cos(i), r*np.sin(i)) for i in np.linspace(90, 270, 5)*d2r][::-1]
    pnts1=[]
    for i in np.linspace(-90, 90, N/2+1)*d2r:
        c=np.cos(i)
        s=np.sin(i)
        for v in pnt_:
            x=v[0]*c-v[1]*s+LL
            y=v[0]*s+v[1]*c
            pnts1.append((x,y))    
    n=LL/L
    dist=np.linspace(0, LL, int(n)+1)
    pnts2=[]
    c=np.cos(90*d2r)
    s=np.sin(90*d2r)
    for x_ in dist[1:-1:][::-1]:
        for v in pnt_:
            x=v[0]*c-v[1]*s+x_
            y=v[0]*s+v[1]*c
            pnts2.append((x,y))    
    RR=1.03*R        
    pnts=pnts1+pnts2+[(-i[0]+LL, i[1]) for i in pnts1[::-1]]+[(i[0], -i[1]) for i in pnts2[::-1]]
    pnts=pnts+[(LL-0.01, -RR)]+[(RR*np.cos(i), RR*np.sin(i)) for i in np.linspace(270, 90, 10)*d2r]+[(LL+RR*np.cos(i),RR*np.sin(i)) for i in np.linspace(90, -89, 10)*d2r] 
    Extrusion(par3, "%s_belt"%(pairname), pnts, bline+T/10, T/10*8, "RED", ref_mar) 
    
    return pnts
        

def Xform(p1, a_=0, p0=(0,0,0)):
    a=np.radians(a_)
    c=np.cos(a)
    s=np.sin(a)
    x=c*p1[0]-s*p1[1]+p0[0]
    y=s*p1[0]+c*p1[1]+p0[1]
    return (x,y,p1[2]+p0[2])

def N_(p): 
    return (p[0], p[1], -p[2])

def DZ(p1, dz):
    return (p1[0], p1[1], p1[2]+dz)

def Z(p1, z):
    return (p1[0], p1[1], z)

def NZ(p1, z):
    return (p1[0], p1[1], -z)

def cir_pnts(r, xyz=(0,0)):
    temp=[(xyz[0]+r*np.cos(i), xyz[1]+r*np.sin(i)) for i in np.radians(np.linspace(0, 330, 11))]
    return temp

def pcir_pnts(r, s=0, e=180, n=10, xyz=(0,0,0)):
    temp=[(xyz[0]+r*np.cos(i), xyz[1]+r*np.sin(i)) for i in np.radians(np.linspace(s, e, n))]
    return temp


def createJ(parent, name_, p1, p2, pos, ori, ref, type_="revolute"):
    mar1=Marker(p1, "%s_marI"%name_, pos, ori, ref=ref)
    mar2=Marker(p2, "%s_marJ"%name_, pos, ori, ref=ref)
    J=Joint(parent, name_, mar1, mar2, type_)
    return J, mar1, mar2

def createLink(par, name, p1, p2, r, T, ref):
    if par.__class__.__name__=="Part":
        p=par
    else:    
        p=Part(par, name)
    mar1=Marker(p, "%s_endI"%name, p1, ref=ref)
    mar2=Marker(p, "%s_endJ"%name, p2, ref=ref)
    Link(p, "%s_link"%name, r, T, mar1, mar2, union=True)
    return p

def createPlate(par, name, ps, r, T, ref):
    i=1
    pms=[]
    for p in ps:
        pm=Marker(par, name+"platem"+str(i), p, ref=ref)
        pms.append(pm)
        i=i+1
    Plate(par, name, r, T, pms) 
    return par

def createB(parent, name_, p1, p2, pos, ori, K, ref):
    mar1=Marker(p1, "%s_marI"%name_, pos, ori, ref=ref)
    mar2=Marker(p2, "%s_marJ"%name_, pos, ori, ref=ref)
    B= Bushing(parent, name_, mar1, mar2, K)      
    return B

class SliderJoint(entity):
    def __init__(self, parent, Name, dl_, dr_, L_, L1_, R_,  mar1, vis="on"):	
        entity.__init__(self, parent, Name, "_")
        self.dl=dl_
        self.dr=dr_
        self.L=L_
        self.L1=L1_
        self.R=R_
	self.mar1=mar1
	self.part2=None
	self.mar2=None
        self.parts=[]
        self.vis=vis
    
    def nextBase(self):
	return self.mar2    


class SliderMechanismC(SliderJoint):
    def __init__(self, parent, Name, dl_, dr_, L_, L1_, R_,  mar1, alpha1=0, shift1=0, shift2=0, _motion=1, ball=0, inner=0, quad=0, vis="on"):
	SliderJoint.__init__(self, parent, Name, dl_, dr_, L_, L1_, R_, mar1, vis)
	alpha12=(a12(-dr_, R_)-a12(0, R_))/d2r+shift1
        print "alpha12-shift1", alpha12
	self.range=(a12(-dr_, R_)-a12(dl_, R_))
	self.alpha=np.arctan2(R_, L_)

	braceH=R_*4/5.0
        self.braceH=braceH
	T=R_/16.0
	r=0.1*R_
        delta=2*r
        alpha56=np.arctan2(R_, L_-delta-dl_)
        print "alpha56", np.degrees(alpha56)
        
        W=braceH/2
        W4=W/4
        T2=T+T
        T3=T+T+T
        T4=T+T3
        T5=T+T4
        #Brace
        self.Brace=Part(self, "Brace")
        (J, self.basemarI, self.basemarJ)=createJ(self, "LeftRevJ", self.Brace, self.mar1.parent(), (0,0,0),(alpha12,0,0), self.mar1)
        braceGeo=Marker(self.Brace, "braceGeo", (0,R_/2,0), (90, -90, -90), ref=self.basemarI)
        W=braceH/2
        pnts=[(W4, -W), (W, -W), (W, W), (W4, W), (W4, W-T), (W-T, W-T), (W-T, -W+T), (W4, -W+T) ]
        Extrusion(self.Brace, "halfBracef",  pnts, -r, r+r+R_, "YELLOW", braceGeo)
        pnts.reverse()
        Extrusion(self.Brace, "halfBraceb",  [(-i[0], i[1]) for i in pnts], -r, r+r+R_, "YELLOW", braceGeo)

        pnts=[(W4, -W), (W-T3, -W), (W-T3, W), (W4, W), (W4, W-T3), (W-T4, W-T), (W-T4, -W+T3), (W4, -W+T3) ]
        pnts.reverse()
        Extrusion(self.Brace, "halfBracef1",  pnts, -dl_-delta-R_, dl_+delta+R_-r, "YELLOW", braceGeo)
        Extrusion(self.Brace, "halfBraceb1",  [(-i[0], i[1]) for i in pnts], -dl_-delta-R_, dl_+delta+R_-r, "YELLOW", braceGeo)
        pnts=[(-W+T3, 0), (-W+T4, 0), (-W+T4, W-T), (W-T4, W-T), (W-T4,0), (W-T3,0), (W-T3,W), (-W+T3, W)]
        Extrusion(self.Brace, "halfBrace2",  pnts, -L_-r, r+(L_-dl_-delta-R_), "YELLOW", braceGeo)
        pnts=pcir_pnts(r, 180, 360)+[(r,r), (-r,r)]
        Extrusion(self.Brace, "frontEarL",  pnts, W/2, W/2, "YELLOW", self.basemarI)
        Extrusion(self.Brace, "BackEarL",  pnts, -W, W/2, "YELLOW", self.basemarI)

        pnts=pcir_pnts(r)+[(-r,-r), (r,-r)]
        Extrusion(self.Brace, "BackEarR",  [(i[0]+dl_+delta, i[1]+R_) for i in pnts], -W+T, W4+T2, "YELLOW", self.basemarI)
        Extrusion(self.Brace, "FrontEarR",  [(i[0]+dl_+delta, i[1]+R_) for i in pnts], W-T3-W4, W4+T2, "YELLOW", self.basemarI)
        Extrusion(self.Brace, "BackEarF",  [(i[0]+L_, i[1]+R_) for i in pnts], -W+T3, W4, "YELLOW", self.basemarI)
        Extrusion(self.Brace, "FrontEarF",  [(i[0]+L_, i[1]+R_) for i in pnts], W-T3-W4, W4, "YELLOW", self.basemarI)

        #Slider
        slider=Part(self, "slider") 
        slide_basemar=Marker(slider, "slide_BaseMar", ref=braceGeo)
        pnts=[(W-T4,W-T), (W4, W-T), (W4,W+T+2*r*0), (-W4,W+T+2*r*0), (-W4, W-T), (-W+T4, W-T), (-W+T4, -W+T), (W-T4, -W+T)]
        Extrusion(slider, "slider",  [(i[0], i[1]-T) for i in pnts], -dr_-delta-r, 2*r, "RED", slide_basemar)
        pnts=[(-W4, -W), (W4, -W), (W4, -W+T), (-W4, -W+T)]
        Extrusion(slider, "slider1",  [(i[0], i[1]+W*2-T) for i in pnts], r-dr_-delta, dr_+delta, "RED", slide_basemar)
        
	motionFunc=Variable(self, "motionFunc",  "%f+sin(time/5*PI-PI/2)*%f"%((dl_-dr_)/2, (dl_+dr_)/2*_motion))
        transJ=Joint(self, "SliderJoint", slide_basemar, braceGeo, "translational", motion="-VARVAL(%s)"%motionFunc.name())
	Measure(self, "ActForce", "-MOTION(%s, 0, 4, %s)"%(transJ.motionName(), braceGeo.name()))

        sliderLM=Marker(slider, "toLinkL_F", (0, R_, 0), ref=self.basemarI) 
        pnts=[(i[0]+dr_+delta, i[1]-R_) for i in ([(-r,r)]+pcir_pnts(r,180, 360)+[(r, r)])]
        Extrusion(slider, "slider2",  pnts, -W4, 2*W4, "RED", sliderLM)
        Extrusion(slider, "slider3",  cir_pnts(r/2, (dr_+delta, -R_,0)), -(W-T3), 2*(W-T3), "RED", sliderLM)
        Extrusion(slider, "slider4",  cir_pnts(r), -W-T5, 2*W+2*T5, "RED", sliderLM)
        Extrusion(slider, "slider5",  pcir_pnts(r)+[(-r, -r), (r,-r)], -W4, 2*W4, "RED", sliderLM)

        ple=(0, R_, W+T/2+5*T)
        pLnkLF_I=ple
        pLnkLF_J=(-R_*np.cos(30*d2r), R_-R_*np.sin(30*d2r), ple[2])
        self.LnkLF=(R_*np.cos((60+alpha12+90)*d2r), R_*np.sin((90+60+alpha12)*d2r), 0)
        LinkLF=createLink(self, "LinkLF", pLnkLF_I, pLnkLF_J, r*2, T, self.basemarJ)
        createJ(self, "slider_linkF", LinkLF, slider, pLnkLF_I, (0,0,0), self.basemarJ) 
        createJ(self, "crank_linkLF", self.mar1.parent(), LinkLF, pLnkLF_J, (0,0,0), self.basemarJ) 
       
        pLnkLB_I=(ple[0], ple[1], -ple[2])
        pLnkLB_J=(-R_*np.cos(30*d2r), R_-R_*np.sin(30*d2r), -ple[2])
        LinkLB=createLink(self, "LinkLB", pLnkLB_I, pLnkLB_J, r*2, T, self.basemarJ)
        createJ(self, "slider_linkB", LinkLB, slider, pLnkLB_I, (0,0,0), self.basemarJ) 
        createJ(self, "crank_linkLB", self.mar1.parent(), LinkLB, pLnkLB_J, (0,0,0), self.basemarJ) 

        alpha34=a34(-dl_+dr_, R_)
        alpha34f=a34(dr_, R_)
        alpha34ic=a34(-dl_, R_)
        print "alpha34", alpha34/d2r
        print "alpha34ic", alpha34ic/d2r
        print "alpha34f", alpha34f/d2r
        dalpha34=alpha34ic-alpha34
        print "dalpha34", dalpha34/d2r


        temp=W-T3+T/2
        p1=(dr_+delta, 0, temp)
        p2=(dl_+delta+R_*np.cos(-alpha34), R_+R_*np.sin(-alpha34), temp)
        LinkRF=createLink(self, "LinkRF", p1, p2, r*2, T, self.basemarJ)
        createJ(self, "slider_linkRF", LinkRF, slider, p1, (0,0,0), self.basemarJ) 
        LinkRB=createLink(self, "LinkRB", N_(p1), N_(p2), r*2, T, self.basemarJ)
        createJ(self, "slider_linkRB", LinkRB, slider, N_(p1), (0,0,0), self.basemarJ) 

        alpha34_center=alpha34f+(alpha34ic-alpha34f)/2.0
        print "alpha34Cen", alpha34_center/d2r
        offsetAng=np.pi/2-alpha34_center
        print "offsetang", offsetAng/d2r
        p2_p3=(dl_+delta+R_*np.cos(-alpha34), R_+R_*np.sin(-alpha34), temp+T2)
        p2_p3_sR=(dl_+delta+R_*np.cos(-alpha34)*.77, R_+R_*np.sin(-alpha34)*.77, temp+T2)
        p2_p2=(dl_+delta+R_*np.cos(-alpha34-offsetAng), R_+R_*np.sin(-alpha34-offsetAng), temp+T2)
        p2_p1=(dl_+delta, R_, temp+T2)

        part2=Part(self, "Part2")
        createJ(self, "RevRJF", part2, LinkRF,  p2_p3, (0,0,0), self.basemarJ) 
        createJ(self, "RevRJB", part2, LinkRB,  N_(p2_p3), (0,0,0), self.basemarJ) 
        createJ(self, "part2_bracef", self.Brace, part2, p2_p1, (0,0,0), self.basemarJ) 
        createJ(self, "part2_braceb", self.Brace, part2, N_(p2_p1), (0,0,0), self.basemarJ) 
        createPlate(part2, "trianglef", (p2_p1, p2_p2, p2_p3), r, T, self.basemarJ)
        createPlate(part2, "triangleb", (N_(p2_p1), N_(p2_p2), N_(p2_p3)), r, T, self.basemarJ)

        self.splate=[((i[0]-p2_p1[0])*.77, (i[1]-p2_p1[1])*.77, i[2]+T) for i in  (p2_p1, p2_p2, p2_p3)]
        self.part21=Part(self, "part21")
        createPlate(self.part21, "plate",  self.splate[:3], r, T, self.basemarJ)
        temp3=Marker(self.part21, "cynmar", DZ(self.splate[2], -T), ref=self.basemarJ)
        Extrusion(self.part21, "cyn", cir_pnts(r/2), T/2, T, "RED", temp3)  
        createJ(self, "part21_bracef", self.Brace, self.part21, self.splate[0], (0,0,0), self.basemarJ) 
        Link21RF=createLink(self, "Link21_RF", DZ(p2_p3_sR, -T), DZ(self.splate[2],-T2), r*2, T, self.basemarJ)
        createJ(self, "part21_link", part2, Link21RF, p2_p3_sR, (0,0,0), self.basemarJ) 
        createJ(self, "part2_link", self.part21, Link21RF, self.splate[2], (0,0,0), self.basemarJ) 

        alpha11=shift1+self.range/2/d2r
        print alpha11, "xxx"
        alpha11=-(alpha11+90)*d2r
        #Link(self.Brace, "link1", r, T, mar11I, mar11J, union=False)
        temp=-W+T/2
        self.plate1=((0,0, temp), (2.0/3*R_*np.cos(alpha11), 2.0/3*R_*np.sin(alpha11), temp), (2.0/3*R_*np.cos(alpha11), 0, temp))
        createPlate(self.Brace, "plate1", self.plate1, r, T, self.basemarJ)
        
        self.alpha1st=alpha12*d2r
        offsetAng2=shift2*d2r+alpha34ic-shift1*d2r
        print "offsetAng2", offsetAng2/d2r
        self.alpha2nd=self.alpha1st-alpha34+offsetAng2   #zero state
        print "alpha2nd", self.alpha2nd/d2r

        crankFF=Part(self, "CrankFF")
        temp=W+T/2+3*T
        cr_p1=(L_, R_, temp)
        cr_p3=(L_+L1_*np.cos(-alpha34+offsetAng2), R_+L1_*np.sin(-alpha34+offsetAng2), temp)
        cr_p2=(L_+R_*np.cos(-alpha34-offsetAng), R_+R_*np.sin(-alpha34-offsetAng), temp)
        crankps=(cr_p1, cr_p2, cr_p3)
        createPlate(crankFF, "trianglef1", (cr_p1, cr_p2, cr_p3), r, T, self.basemarJ)
        crankps=[(i[0], i[1], -temp) for i in (cr_p1, cr_p2, cr_p3)]

        createPlate(crankFF, "triangleb1", [N_(i) for i in (cr_p1, cr_p2, cr_p3)], r, T, self.basemarJ)
        createJ(self, "crank_brace_f", crankFF, self.Brace, (crankps[0][0], crankps[0][1], 0), (0,0,0), self.basemarJ) 
        cenm=Marker(crankFF, "centM",  (crankps[0][0],crankps[0][1],0), ref=self.basemarJ)
        Extrusion(crankFF, "connectRod", cir_pnts(r/2), -(W+T4+T), 2*(W+T4+T), "RED", cenm)
        cenm1=Marker(crankFF, "centM1",  (crankps[1][0],crankps[1][1],0), ref=self.basemarJ)
        Extrusion(crankFF, "connectRod2",cir_pnts(r/2), -(temp+T/2), 2*temp+T, "RED", cenm1)
        cenm2=Marker(crankFF, "centM2",  (crankps[2][0],crankps[2][1],0), ref=self.basemarJ)
        Extrusion(crankFF, "connectRod3",cir_pnts(r/2), -(temp+T/2), 2*temp+T, "RED", cenm2)

        temp=W-T3+T+T+T+T/2
        distalLinkf=createLink(self, "distalLinkf", Z(p2_p2, temp), Z(crankps[1],temp), r*2, T, self.basemarJ)
        createJ(self, "crank_distalLinkf", crankFF, distalLinkf, Z(crankps[1],temp), (0,0,0), self.basemarJ) 
        createJ(self, "part2_distalLinkf", part2, distalLinkf, Z(p2_p2, temp) , (0,0,0), self.basemarJ) 

        distalLinkb=createLink(self, "distalLinkb", Z(p2_p2, -temp), Z(crankps[1],-temp), r*2, T, self.basemarJ)
        createJ(self, "crank_distalLinkb", crankFF, distalLinkb, Z(crankps[1],-temp), (0,0,0), self.basemarJ) 
        createJ(self, "part2_distalLinkb", part2, distalLinkb, Z(p2_p2, -temp) , (0,0,0), self.basemarJ) 
       # balance mechanism
	self.alpha21=np.arctan2(R_, dl_+delta)
        print (np.pi/2-self.alpha21)/d2r, alpha34_center/d2r

        for i in self.getKids("Part"): i.visual(self.vis)

        self.T=T
        self.r=r
        self.W=W+T3
        self.Wi=W
        self.crank=crankFF
        return        

if __name__ == "__main__":	
  paraCompf1=[]  
  paraCompb1=[]  
  paraCompf2=[]  
  paraCompb2=[]  
  scale=0.1
  dl=1.3448
  dr=0.9
  L=4*scale
  R=1*scale
  alpha1=45*0
  model=Model("sliderActuator", mm="meter", mass="kg", force="newton", icon_size=0.021)
  ground=model.ground()

  mar1=Marker(ground, "ground_marker", (0,0,0), (0, 0, alpha1))
  shift1=-20
  shift2=-100.0
  lm11=SliderMechanismC(model, "SLM11", dl*R, dr*R, L, L,  R, mar1, alpha1,shift1=shift1, shift2=shift2, vis="off")
  #for i in lm11.getKids("Part"): i.visual("off")
  ParaAng11=lm11.range/2+shift1*d2r+lm11.alpha+np.pi/8
  print "alpha", lm11.alpha/d2r
  print "ParaAng11", ParaAng11/d2r
  deltaAng11=shift2*d2r+lm11.range+np.pi/2
  print "deltaAng11", deltaAng11/d2r
  SR=R/2
  print "range", lm11.range/d2r

  #Parallel mechanism definiation
  
  cs=np.cos(lm11.alpha1st)
  ss=np.sin(lm11.alpha1st)
  dxyz1=(L*cs-R*ss, L*ss+R*cs,0)
  W11=lm11.W
  T11=lm11.T
  WT11_25=W11+T11*2.5
  WT11_15=W11+T11*1.5
  WT11_05=W11+T11*0.5
  upnt1=(SR*np.cos(ParaAng11+np.pi*0.5), SR*np.sin(ParaAng11+np.pi*0.5), WT11_25)
  upnt2=(upnt1[0]+dxyz1[0], upnt1[1]+dxyz1[1], WT11_25)#
  ParaLinkF11= createLink(model, "ParaLinkF11", upnt1, upnt2, lm11.r, lm11.T, mar1)
  paraCompf1.append(ParaLinkF11)
  createJ(model, "J11", ParaLinkF11, ground, upnt1, (0,0,0), mar1)

  ParaLinkB11= createLink(model, "ParaLinkB11", N_(upnt1), N_(upnt2), lm11.r, lm11.T, mar1)
  paraCompb1.append(ParaLinkB11)
  createJ(model, "J11B", ParaLinkB11, ground, N_(upnt1), (0,0,0), mar1)

  upnt3=Z(dxyz1, WT11_25)#
  upnt4=(-SR*np.cos(deltaAng11)+dxyz1[0], -SR*np.sin(deltaAng11)+dxyz1[1], WT11_25)# 
  upnt44=(-SR*np.cos(deltaAng11+np.pi/2)+dxyz1[0], -SR*np.sin(deltaAng11+np.pi/2)+dxyz1[1],WT11_25)# 
#
  upnt1_=(SR*np.cos(ParaAng11+np.pi), SR*np.sin(ParaAng11+np.pi),WT11_25)# 
  upnt2_=(upnt1_[0]+dxyz1[0], upnt1_[1]+dxyz1[1],WT11_25)# 
  upnt2_=Z(Xform(upnt1_, p0=dxyz1),WT11_25)# 

  pLnkJ=lm11.LnkLF
  temp=((0,0, WT11_15),
          (upnt1[0], upnt1[1], WT11_15),
          (pLnkJ[0], pLnkJ[1], WT11_15),
          (pLnkJ[0], -L/3, WT11_15),
          (upnt1_[0], -L/3, WT11_15),
          (upnt1_[0], upnt1_[1], WT11_15))
  createPlate(ground, "triangleF", temp, lm11.r, lm11.T, mar1)
  createPlate(ground, "triangleB", [(i[0],i[1],-i[2]) for i in temp], lm11.r, lm11.T, mar1)
  Extrusion(ground, "cyn2", cir_pnts(lm11.r/2), -WT11_15, 2*WT11_15, ref=mar1)  

  ParaLinkF11_= createLink(model, "ParaLinkF11_", upnt1_, upnt2_, lm11.r, lm11.T, mar1)
  paraCompf1.append(ParaLinkF11_)
  createJ(model, "J11_", ParaLinkF11_, ground, upnt1_, (0,0,0), mar1)

  ParaLinkB11_= createLink(model, "ParaLinkB11_", N_(upnt1_), N_(upnt2_), lm11.r, lm11.T, mar1)
  paraCompb1.append(ParaLinkB11_)
  createJ(model, "J11B_", ParaLinkB11_, ground, N_(upnt1_), (0,0,0), mar1)

  DeltaF1=Part(model, "deltaF1")
  paraCompf1.append(DeltaF1)
  temp=[(i[0], i[1], WT11_15) for i in (upnt3,   upnt2, upnt2_, upnt4)]
  createPlate(DeltaF1, "triangle", temp, lm11.r, lm11.T, mar1)
  createJ(model, "J12", DeltaF1, ParaLinkF11, upnt2, (0,0,0), mar1)
  createJ(model, "J13", DeltaF1, lm11.Brace, upnt3, (0,0,0), mar1)
  createJ(model, "J12_", DeltaF1, ParaLinkF11_, upnt2_, (0,0,0), mar1)

  DeltaB1=Part(model, "deltaB1")
  paraCompb1.append(DeltaB1)
  temp=[(i[0], i[1], -WT11_15) for i in (upnt44,  upnt2, upnt2_)]
  createPlate(DeltaB1, "triangle", temp, lm11.r, lm11.T, mar1)
  createJ(model, "J12B", DeltaB1, ParaLinkB11, N_(upnt2), (0,0,0), mar1)
  createJ(model, "J13B", DeltaB1, lm11.Brace, N_(upnt3), (0,0,0), mar1)
  createJ(model, "J12B_", DeltaB1, ParaLinkB11_, N_(upnt2_), (0,0,0), mar1)

  cs=np.cos(lm11.alpha2nd)
  ss=np.sin(lm11.alpha2nd)

  dxyz2=(lm11.L1*cs, lm11.L1*ss,0)
  upnt5=(upnt4[0]+dxyz2[0], upnt4[1]+dxyz2[1], upnt4[2])#WT11_25
  upnt6=(upnt3[0]+dxyz2[0], upnt3[1]+dxyz2[1], upnt3[2])
  upnt7=(upnt44[0]+dxyz2[0], upnt44[1]+dxyz2[1], upnt44[2])

  ParaLinkF12=createLink(model, "ParaLinkF12", upnt4, upnt5, lm11.r, lm11.T, mar1)
  paraCompf1.append(ParaLinkF12)
  createJ(model, "J14", DeltaF1, ParaLinkF12, upnt4, (0,0,0), mar1)

  ParaLinkB12=createLink(model, "ParaLinkB12", N_(upnt44), N_(upnt7), lm11.r, lm11.T, mar1)
  paraCompb1.append(ParaLinkB12)
  createJ(model, "J14B", DeltaB1, ParaLinkB12, N_(upnt44), (0,0,0), mar1)

  for i in paraCompf1: i.visual("off")
  for i in paraCompb1: i.visual("off")

  DeltaF2=Part(model, "DeltaF2")
  paraCompf2.append(DeltaF2)
  createJ(model, "J15", DeltaF2, lm11.crank, Z(upnt6, WT11_15), (0,0,0), mar1)
  createJ(model, "J16", DeltaF2, ParaLinkF12, Z(upnt5, WT11_15), (0,0,0), mar1)

  DeltaB2=Part(model, "deltaB2")
  paraCompb2.append(DeltaB2)
  createJ(model, "J15B", DeltaB2, lm11.crank, N_(upnt6), (0,0,0), mar1)
  createB(model, "J16B", DeltaB2, ParaLinkB12, N_(upnt7), (0,0,0), (1.0e6, 1.0e6, 1.0e6), mar1)
#

  Dl1=0.2*upnt5[0]
  mar2pos=(upnt5[0]+Dl1,upnt5[1],0)
  Dl1=0.25*upnt6[0]
  mar2pos=(upnt6[0]+Dl1,upnt6[1],0)
  mar2=Marker(DeltaF2, "mar22", mar2pos, (0, 0, 0 ), ref=mar1)
  R2=R-lm11.T*4
  outsize1=WT11_15+lm11.T/2
  insize1=WT11_15-lm11.T/2
  lm22=SliderMechanismC(model, "SLM22", dl*R2, dr*R2, L, L,  R2, mar2, alpha1,shift1=shift1, shift2=shift2, _motion=0.3, vis="off")

  SR=lm22.R/2
  WT22_05=lm22.W+lm22.T*0.5
  OSZ1_T05=outsize1+lm22.T*0.5
  OSZ1_NT05=outsize1-lm22.T*0.5
  plate1=[(i[0], i[1], i[2]-lm22.T*2) for i in lm22.plate1]      
  plate1=[Xform(i, lm22.alpha1st/d2r, (-Dl1, 0, -lm22.T*2)) for i in lm22.plate1]

#balance mechanism
  mar22__=Marker(lm22.part21, "mar22", (0,0,lm11.Wi), ref=mar2)#Marker(lm22.part21, "xxx", ref=mar2))

  idlerb1=createLink(model, "idlerb1", plate1[0], plate1[1], lm22.r, lm22.T, mar2)
  #createJ(model, "iderb1_lm11", idlerb1, lm11.crank, (upnt6[0],upnt6[1],plate1[0][2]), (0,0,0), mar1)
  BalLinkB0= createLink(model, "BalLinkB0", DZ(plate1[1], lm22.T), Xform(lm22.plate1[1], lm22.alpha1st/d2r, (0,0,-lm22.T)), lm22.r, lm22.T, mar2)
  createJ(model, "ider1_2BalLnkB0", BalLinkB0, idlerb1, plate1[1], (0,0,0), mar2)
  createJ(model, "lm22_2BalLnkB0", BalLinkB0, lm22.Brace, Xform(plate1[1], 0, (Dl1,0,0)), (0,0,0), mar2)

  mar22=Marker(idlerb1, "mar22", Z(upnt6,0), ref=mar1)

  idlerf1=Part(model, "idlerf1")
  mar22_=Marker(idlerf1, "mar22", ref=mar22)
  pnts=Sprocket_Pair("chain_f01", SR, 24, idlerf1, lm22.part21, DeltaF2, upnt6,  mar2pos, lm11.Wi-lm11.T, lm11.T, mar1, right=0) 
  l=zip(*pnts)
  #plt.plot(l[0], l[1])

  #createJ(model, "idlerf1_crank", idlerf1, lm11.crank, Z(upnt6, lm11.Wi-lm11.T), (0,0,0), mar1) 
  
  idlerf2=Part(model, "idlerf2")
  Sprocket_Pair("chain_f12", SR, 24, idlerf2, idlerf1, lm11.crank, upnt3,  upnt6, lm11.Wi, lm11.T, mar1, right=0) 
  #createJ(model, "idlerf2_crank", idlerf2, lm11.crank, Z(upnt3, lm11.Wi-lm11.T), (0,0,0), mar1) 

  idlerb2=Part(model, "idlerb2")
  Sprocket_Pair("chain_b12", SR, 24, idlerb2, idlerb1, lm11.crank, upnt3,  upnt6, -lm11.Wi-lm11.T, lm11.T, mar1) 
  #createJ(model, "idlerb2_crank", idlerb2, lm11.crank, Z(upnt3, -lm11.Wi-lm11.T), (0,0,0), mar1) 

  L1=0.5*L
  R1=L1/2
  a_=lm11.alpha1st+lm11.alpha+np.pi
  wpnt1=(L1*np.cos(a_), L1*np.sin(a_), 0)
  temp=[Xform((-lm11.R, lm11.R/2-lm11.braceH/2,0), lm11.alpha1st/d2r), Xform((-lm11.R, lm11.R/2+lm11.braceH/2,0), lm11.alpha1st/d2r), wpnt1]
  createPlate(lm11.Brace, "plateF", [Z(i, lm11.Wi+lm11.T/2) for i in temp], lm11.r, lm11.T, mar1)
  createPlate(lm11.Brace, "plateB", [NZ(i, lm11.Wi+lm11.T/2) for i in temp], lm11.r, lm11.T, mar1)
  bal2=Part(model, "bal2")
  GeoMarBal2=Marker(bal2, "cynMar", wpnt1, ((np.pi+lm11.alpha2nd)/d2r,0,0), ref=mar1)
  createJ(model, "bal2_bal1", bal2, lm11.Brace, wpnt1, (0,0,0), mar1)
  #Extrusion(bal2, "cyn2", cir_pnts(lm11.r, wpnt1), -(lm11.Wi+lm11.T), 2*(lm11.Wi+lm11.T), "RED", GeoMarBal2)

  splate=[Xform(i, lm11.alpha1st/d2r) for i in lm11.splate]
  splatebal2=[Xform(i, lm11.alpha1st/d2r, wpnt1) for i in lm11.splate]
  Bal2_1_link=createLink(model, "bal_link_2_1", splate[1], splatebal2[1], lm11.r, lm11.T, mar1)
  createJ(model, "bal2_part21", Bal2_1_link, lm11.part21, splate[1], (0,0,0), mar1)
  createJ(model, "bal2_link", bal2, Bal2_1_link, splatebal2[1], (0,0,0), mar1)
  
  idlerf3=Part(model, "idlerf3")
  Sprocket_Pair("chain_f23", SR, 24, idlerf3, idlerf2, lm11.Brace, wpnt1,  upnt3, lm11.Wi+lm11.T, lm11.T, mar1, right=0) 
  #(J, idlerf3I, idlerf3J)=createJ(model, "idlerf3_lm11", idlerf3, lm11.Brace, Z(wpnt1, lm11.Wi+lm11.T), (0,0,0), mar1) 

  bal3=Part(model, "bal3")
  idlerb3=Part(model, "idlerb3")
  Sprocket_Pair("chain_b23", SR, 24, idlerb3, idlerb2, lm11.Brace, wpnt1,  upnt3, -lm11.Wi-lm11.T*2, lm11.T, mar1, right=0) 
  #(J, idlerb3I, idlerb3J)=createJ(model, "idlerb3_lm11", idlerb3, lm11.Brace, NZ(wpnt1, lm11.Wi+lm11.T), (0,0,0), mar1) 


  L2=0.5*L
  R2=L2/3
  Extrusion(bal2, "cyn3", pcir_pnts(R1, 90, 270)+pcir_pnts(R2, -90, 90, xyz=(L2, 0, 0)), -(lm11.Wi-lm11.T*0), 2*(lm11.Wi-lm11.T*0), "RED", GeoMarBal2)
  wpnt2=Xform((L2, 0, 0), (np.pi+lm11.alpha2nd)/d2r, wpnt1)

  idlerf4=Part(model, "idlerf4")
  Sprocket_Pair("chain_f34", SR, 24, idlerf4, idlerf3, bal2, wpnt2,  wpnt1, lm11.Wi+lm11.T*2, lm11.T, mar1, right=0) 
  #(J, idlerf4I, idlerf4J)=createJ(model, "idlerf4_bal2", idlerf4, bal2, Z(wpnt2, lm11.Wi+lm11.T), (0,0,0), mar1) 

  L3=0.25*L
  R3=L3/4
  a_=lm22.alpha1st+lm22.alpha+np.pi
  wpnt3=Xform((L3, 0, 0), a_/d2r, wpnt2)

  createLink(bal3, "linkF", Z(wpnt3, lm11.Wi+lm11.T/2), Z(wpnt2, lm11.Wi+lm11.T/2), lm11.r*4, lm11.T, mar1)
  createLink(bal3, "linkB", NZ(wpnt3, lm11.Wi+lm11.T/2), NZ(wpnt2, lm11.Wi+lm11.T/2), lm11.r*4, lm11.T, mar1)
  (J, bal3I, bal3J)=createJ(model, "bal3_bal2", bal3, bal2, wpnt2, (0,0,0), mar1)

  Sprocket_Pair("chain_b34", SR, 24, bal3, idlerb3, bal2, wpnt2,  wpnt1, -lm11.Wi-lm11.T*3, lm11.T, mar1, left=0, right=0) 
  Extrusion(bal3, "cyn", cir_pnts(lm11.r, wpnt2),  -lm11.Wi-lm11.T*2, lm11.T, "RED", Marker(bal3, "cyn_mar", ref=mar1))

  L4=0.5*L
  R4=L4/3
  bal4=Part(model, "bal4")
  GeoMarBal4=Marker(bal4, "cynMar", wpnt3, ((np.pi+lm22.alpha2nd)/d2r,0,0), ref=mar1)
  Extrusion(bal4, "cyn3", pcir_pnts(R3, 90, 270)+pcir_pnts(R4, -90, 90, xyz=(L4, 0, 0)), -(lm11.Wi-lm11.T*0), 2*(lm11.Wi-lm11.T*0), "RED", GeoMarBal4)
  (J, bal4I, bal3J)=createJ(model, "bal4_bal3", bal4, bal3, wpnt3, (0,0,0), mar1)
  Sprocket_Pair("chain_f45", SR, 24, bal4, idlerf4, bal3, wpnt3,  wpnt2, lm11.Wi+lm11.T, lm11.T, mar1, left=0, right=0) 
#balance mechanism

  ParaAng22=lm22.range/2+shift1*d2r+lm22.alpha+np.pi/8
  deltaAng22=shift2*d2r+lm22.range+np.pi/2
  cs=np.cos(lm22.alpha1st)
  ss=np.sin(lm22.alpha1st)
  dxyz3=(lm22.L*cs-lm22.R*ss, lm22.L*ss+lm22.R*cs,0)
  vpnt1=(SR*np.cos(ParaAng22+np.pi*0.5), SR*np.sin(ParaAng22+np.pi*0.5),WT22_05)
  vpnt2=(vpnt1[0]+dxyz3[0], vpnt1[1]+dxyz3[1],WT22_05)

  ParaLinkF21= createLink(model, "ParaLinkF21", Z(vpnt1, OSZ1_NT05), Z(vpnt2, OSZ1_NT05), lm22.r, lm22.T, mar2)
  paraCompf2.append(ParaLinkF21)
  createJ(model, "J21", ParaLinkF21, DeltaF2, DZ(vpnt1, OSZ1_NT05), (0,0,0), mar2)

  ParaLinkB21= createLink(model, "ParaLinkB21", Z(vpnt1, -OSZ1_NT05), Z(vpnt2, -OSZ1_NT05), lm22.r, lm22.T, mar2)
  paraCompb2.append(ParaLinkB21)
  createJ(model, "J21B", ParaLinkB21, DeltaB2, Z(vpnt1, -OSZ1_NT05), (0,0,0), mar2)

  vpnt3=DZ(dxyz3, lm22.W+lm22.T/2)
  vpnt4=(-SR*np.cos(deltaAng22)+dxyz3[0], -SR*np.sin(deltaAng22)+dxyz3[1], lm22.W+lm22.T/2)
  vpnt44=(-SR*np.cos(deltaAng22+np.pi/2)+dxyz3[0], -SR*np.sin(deltaAng22+np.pi/2)+dxyz3[1], lm22.W+lm22.T/2)
#
  vpnt1_=(SR*np.cos(ParaAng22+np.pi), SR*np.sin(ParaAng22+np.pi), lm22.W+lm22.T/2)
  vpnt2_=(vpnt1_[0]+dxyz3[0], vpnt1_[1]+dxyz3[1], lm22.W+lm22.T/2)
  ParaLinkF21_= createLink(model, "ParaLinkF21_", Z(vpnt1_, OSZ1_NT05), Z(vpnt2_, OSZ1_NT05), lm22.r, lm22.T, mar2)
  paraCompf2.append(ParaLinkF21_)
  createJ(model, "J21_", ParaLinkF21_, DeltaF2, Z(vpnt1_, OSZ1_NT05), (0,0,0), mar2)

  pLnkJ=lm22.LnkLF
  temp=[Z(i,WT11_15) for i in ((upnt7[0]-mar2pos[0], upnt7[1]-mar2pos[1],0), (upnt6[0]-mar2pos[0], upnt6[1]-mar2pos[1],0), (upnt5[0]-mar2pos[0], upnt5[1]-mar2pos[1],0))]#, vpnt1_, (0,0,0), vpnt1, pLnkJ)]
  createPlate(DeltaF2, "triangleF", temp, lm22.r, lm22.T, mar2)
  temp=[Z(i,WT11_05) for i in ((upnt7[0]-mar2pos[0], upnt7[1]-mar2pos[1],0), (upnt5[0]-mar2pos[0], upnt5[1]-mar2pos[1],0), vpnt1_, (0,0,0), vpnt1, pLnkJ)]
  createPlate(DeltaF2, "triangleF1", temp, lm22.r, lm22.T, mar2)
  temp=[Z(i,-WT11_15) for i in ((upnt7[0]-mar2pos[0], upnt7[1]-mar2pos[1],0), (upnt6[0]-mar2pos[0], upnt6[1]-mar2pos[1],0), (upnt5[0]-mar2pos[0], upnt5[1]-mar2pos[1],0))]#, vpnt1_, (0,0,0), vpnt1, pLnkJ)]
  createPlate(DeltaB2, "triangleB", temp, lm22.r, lm22.T, mar2)
  temp=[Z(i,-WT11_05) for i in ((upnt7[0]-mar2pos[0], upnt7[1]-mar2pos[1],0), (upnt5[0]-mar2pos[0], upnt5[1]-mar2pos[1],0), vpnt1_, (0,0,0), vpnt1, pLnkJ)]
  createPlate(DeltaB2, "triangleB1", temp, lm22.r, lm22.T, mar2)
  #Extrusion(DeltaF2, "cyn", cir_pnts(lm22.r/2, (upnt7[0]-mar2pos[0], upnt7[1]-mar2pos[1],0)), -WT11_15, 2*WT11_15, ref=mar2)  
  Extrusion(DeltaF2, "cyn2", cir_pnts(lm22.r/2), -WT11_15, 2*WT11_15, ref=mar2)  

  ParaLinkB21_= createLink(model, "ParaLinkB21_", Z(vpnt1_, -OSZ1_NT05), Z(vpnt2_, -OSZ1_NT05), lm22.r, lm22.T, mar2)
  paraCompb2.append(ParaLinkB21_)
  createJ(model, "J21B_", ParaLinkB21_, DeltaB2, Z(vpnt1_, -OSZ1_NT05), (0,0,0), mar2)

  DeltaF3=Part(model, "deltaF3")
  paraCompf2.append(DeltaF3)
  temp=[(i[0], i[1], lm22.W+lm22.T+lm22.T/2) for i in (vpnt3,   vpnt2, vpnt2_, vpnt4)]
  createPlate(DeltaF3, "triangle", temp, lm22.r, lm22.T, mar2)
  createJ(model, "J22", DeltaF3, ParaLinkF21, vpnt2, (0,0,0), mar2)
  createJ(model, "J23", DeltaF3, lm22.Brace, vpnt3, (0,0,0), mar2)
  createJ(model, "J22_", DeltaF3, ParaLinkF21_, vpnt2_, (0,0,0), mar2)
  mar2_DF3=Marker(DeltaF3, "mar2_df3", ref=mar2)
  Extrusion(DeltaF3, "cyn", cir_pnts(lm22.r/2, vpnt2), -outsize1-lm22.T*2, 2*(outsize1+lm22.T*2), ref=mar2_DF3)  
  Extrusion(DeltaF3, "cyn1", cir_pnts(lm22.r/2, vpnt2_),  lm22.W+lm22.T+lm22.T/2, (outsize1+lm22.T*2)-(lm22.W+lm22.T+lm22.T/2), ref=mar2_DF3)  
  Extrusion(DeltaF3, "cyn2", cir_pnts(lm22.r/2, vpnt2_),  -outsize1-lm22.T*2, (outsize1+lm22.T*2)-(lm22.W+lm22.T+lm22.T/2), ref=mar2_DF3)  

  DeltaB3=Part(model, "deltaB3")
  paraCompb2.append(DeltaB3)
  temp=[(i[0], i[1], -lm22.W-lm22.T-lm22.T/2) for i in (vpnt44,  vpnt2, vpnt2_)]
  createPlate(DeltaB3, "triangle", temp, lm22.r, lm22.T, mar2)
  createJ(model, "J22B", DeltaB3, ParaLinkB21, N_(vpnt2), (0,0,0), mar2)
  createJ(model, "J23B", DeltaB3, lm22.Brace, N_(vpnt3), (0,0,0), mar2)
  createJ(model, "J22B_", DeltaB3, ParaLinkB21_, N_(vpnt2_), (0,0,0), mar2)

  cs=np.cos(lm22.alpha2nd)
  ss=np.sin(lm22.alpha2nd)

  dxyz4=(lm22.L1*cs, lm22.L1*ss,0)
  p5=(vpnt4[0]+dxyz4[0], vpnt4[1]+dxyz4[1], vpnt4[2])
  p6=(vpnt3[0]+dxyz4[0], vpnt3[1]+dxyz4[1], vpnt3[2])
  p7=(vpnt44[0]+dxyz4[0], vpnt44[1]+dxyz4[1], vpnt44[2])

  ParaLinkF22=createLink(model, "ParaLinkF22", DZ(vpnt4, 2*lm22.T), DZ(p5, 2*lm22.T), lm22.r, lm22.T, mar2)
  paraCompf2.append(ParaLinkF22)
  createJ(model, "J24", DeltaF3, ParaLinkF22, DZ(vpnt4, 2*lm22.T), (0,0,0), mar2)


  DeltaF4=createLink(model, "DeltaF4", DZ(p6, lm22.T), DZ(p5, lm22.T), lm22.r, lm22.T, mar2)
  paraCompf2.append(DeltaF4)
  createJ(model, "J25", DeltaF4, lm22.crank, p6, (0,0,0), mar2)
  createJ(model, "J26", DeltaF4, ParaLinkF22, p5, (0,0,0), mar2)

  ParaLinkB22=createLink(model, "ParaLinkB22", N_(DZ(vpnt44, 2*lm22.T)), N_(DZ(p7, 2*lm22.T)), lm22.r, lm22.T, mar2)
  paraCompb2.append(ParaLinkB22)
  createJ(model, "J24B", DeltaB3, ParaLinkB22, N_(DZ(vpnt44, 2*lm22.T)), (0,0,0), mar2)
  DeltaB4=Part(model, "deltaB4")
  paraCompb2.append(DeltaB4)
  createPlate(DeltaB4, "triangle", [(i[0], i[1], -i[2]-lm22.T) for i in (p6, p5, p7)], lm22.r, lm22.T, mar2)
  createJ(model, "J25B", DeltaB4, lm22.crank, N_(p6), (0,0,0), mar2)
  #createJ(model, "J26B", DeltaB4, ParaLinkB22, N_(p7), (0,0,0), mar2)
  createB(model, "J26B", DeltaB4, ParaLinkB22, N_(p7), (0,0,0), (1.0e6, 1.0e6, 1.0e6), mar2)
#
  mar3=Marker(DeltaF4, "mar3", (p5[0],p5[1],0), (0, 0, 0 ), ref=mar2)
  Extrusion(DeltaF4, "cyn", cir_pnts(lm22.r/2), -lm22.W-lm22.T*2, 2*(lm22.W+lm22.T*2), ref=mar3)  

  for i in paraCompf2: i.visual("off")
  for i in paraCompb2: i.visual("off")

  lines=model.commands([])
  pf=file("aview.cmd", "w")
  for l in lines:
      pf.write("%s\n"%l)
  #pf.write("simulation single trans type= static initial_static=no end_time=5 number_of_steps=50\n")
  pf.close()    
  cmd="c:\\MSC.Software\\Adams\\2016\\common\\mdi.bat aview ru-s i e"
  os.system(cmd)
  #plt.show()
