from motionclass import *
from leanslider import *
import numpy as np
import os
zero3=(0,0,0)
d2r=np.pi/180

class SliderJoint(entity):
    def __init__(self, parent, Name, dl_, dr_, L_, L1_, R_,  mar1):	
        entity.__init__(self, parent, Name, "_")
	#if L_<(dl_-dr_): L_=dl_-dr_
        self.dl=dl_
        self.dr=dr_
        self.L=L_
        self.L1=L1_
        self.R=R_
	self.mar1=mar1
	self.part2=None
	self.mar2=None
	#self.alpha=np.degrees(np.arctan2(R_, L_+(dl_-dr_)))
    
    def nextBase(self):
	return self.mar2    

class SliderMechanismLean(SliderJoint):
    def __init__(self, parent, Name, dl_, dr_, L_, L1_, R_,  mar1, alpha1=0, shift1=0, shift2=0, _motion=1, ball=0, inner=0, quad=0):
	SliderJoint.__init__(self, parent, Name, dl_, dr_, L_, L1_, R_, mar1)
	r=0.1*R_
        self.r=r
	T=R_/16.0
        self.T=T
	braceH=R_*3/4.0
        self.braceH=braceH
        self.width=(braceH/2-T)*2
	alpha=np.degrees(np.arctan2(R_, L_+dl_-dr_))
	alpha12=(a12(-dr_, R_)-a12(0, R_))/self.d2r
        print alpha12, shift1
        self.alpha=alpha
        	
	self.FrameAngle=shift1+alpha12	
	self.AlignedLineAngle_Gnd=alpha12+shift1-self.alpha
        baseMarkerI=Marker(self.mar1.parent(), "baseMarkerI", pos=(0,0, 0), orientation=(0,0,self.AlignedLineAngle_Gnd), ref=self.mar1)
	self.Brace=Part(self, "Brace")
        basemar=Marker(self.Brace, "basemarker",  (0,0,0), (0,0,0), baseMarkerI)
	self.BaseMar=basemar
        self.revJoint1=Joint(self, "RevJ", basemar, baseMarkerI)
        self.mar1alignedwithmar2=Marker(self.Brace, "basemaralignedwithmar2",  (0,0,0), (0,0,self.alpha), basemar)  


	rot1=Variable(self, "rot1", "AZ(%s, %s)*RTOD"%(self.mar1alignedwithmar2.name(), self.mar1.name()))
  	self.mar2alignedwithmar1=   Marker(self.Brace, "mar2alignedwithmar1", pos=(L_+dl_-dr_, R_, 0), orientation=(0,0,self.alpha), ref=basemar)
	braceGeoMar=Marker(self.Brace, "braceGeoMar", (r+L_+dl_-dr_, r+braceH/2, 0), (90, -90, -90), ref=basemar)
	pnts=[(T/2, -braceH/2), (braceH/2-T, -braceH/2), (braceH/2-T, braceH/2), (T/2, braceH/2), (T/2, braceH/2-T), (braceH/2-2*T, braceH/2-T), (braceH/2-2*T, -braceH/2+T), (T/2, -braceH/2+T)]
        Extrusion(self.Brace, "halfBraceL", pnts, -R_, 2*R_+L_+dl_-dr_, "RED", braceGeoMar)
        pnts=[(-i[0], i[1]) for i in pnts] 
	pnts.reverse()
        Extrusion(self.Brace, "halfBraceR", pnts, -R_, 2*R_+L_+dl_-dr_, "RED", braceGeoMar)
  	self.brace2disk2=Marker(self.Brace, "brace2disk2", pos=(L_+dl_-dr_, R_, 0), orientation=(0,0,0), ref=basemar)
	pnts=[(-r, -r), (r, -r)]+[(r*np.cos(i), r*np.sin(i)) for i in np.linspace(0, 180, 10)*self.d2r]
	Extrusion(self.Brace, "shoulderf2", pnts, braceH/2-T-T/2, T/2, "YELLOW",  self.brace2disk2)
	Extrusion(self.Brace, "shoulderb2", pnts, -(braceH/2-T), T/2, "YELLOW",  self.brace2disk2)
	pnts=[(r, r), (-r,r)]+[(r*np.cos(i),r*np.sin(i)) for i in np.linspace(180,360, 10)*self.d2r]
	Extrusion(self.Brace, "shoulderf1", pnts, braceH/2-T-T/2, T/2, "YELLOW",  basemar)
	Extrusion(self.Brace, "shoulderb1", pnts, -(braceH/2-T), T/2, "YELLOW",  basemar)
	
	self.part2=Part(self, "disk2")
        self.mar2alignedwithmar1_part2=Marker(self.part2, "mar2alignedwithmar1", ref=self.mar2alignedwithmar1)
  	self.mar2=Marker(self.part2,  "mar2", pos=(L_+dl_-dr_, R_, 0), orientation=(0,0,0), ref=basemar)
        self.revJoint2=Joint(self, "RevJ2", self.mar2, self.brace2disk2)
        baseMarkerII=Marker(self.part2, "baseMarkerII", pos=(0,0,0), orientation=(0,0,0), ref=self.mar2)
	self.disk2_cyn_mar=Marker(self.part2, "Cyn_mar", (0,0,-(inner/2)), ref=self.mar2)
	Cylinder(self.part2, "Cyn", r/2, inner, self.disk2_cyn_mar)

	#slider
	slider=Part(self, "slider")
	sliderI=Marker(slider, "toBrace", (0, r+braceH/2, 0), (90, 90, -90), ref=basemar)
	self.sliderJ=Marker(self.Brace, "toSlider", (0, r+braceH/2, 0), (90, 90, -90), ref=basemar)
	self.sliderGeoMar=Marker(slider, "sliderGeoMar", (0, r+braceH/2, 0),  ref=basemar)
	pnts=[(-r, braceH/2-r), (-r, -braceH/2+r), (L_-r, -braceH/2+r) ] +[(L_+r*np.cos(i), -braceH/2-r+r*np.sin(i)) for i in np.linspace(180, 360, 10)*self.d2r]+ [(L_+r,braceH/2-r), (r, braceH/2-r) ]
	pnts=pnts+[(r, braceH/2), (-r, braceH/2)]
	#pnts=pnts+[(r*np.cos(i), braceH/2+r+r*np.sin(i)) for i in np.linspace(0, 180, 10)*self.d2r]
	pnts.reverse()
	Extrusion(slider, "sliderblock", pnts, -T/2, T, "YELLOW", self.sliderGeoMar)

	slider2link1=Marker(slider, "slider2link1", (0, R_, 0), ref=basemar)		
	pnts=[(-r, -r), (r, -r)]+[(r*np.cos(i), r*np.sin(i)) for i in np.linspace(0, 180, 10)*self.d2r]
	Extrusion(slider, "sliderblock1", pnts, -inner/2+T/2, inner-T, "YELLOW",  slider2link1)

	slider2link2=Marker(slider, "slider2link2", (L_, 0, 0), ref=basemar)		
	pnts=[(r*np.cos(i), r*np.sin(i)) for i in np.linspace(180, 360, 10)*self.d2r]
	Extrusion(slider, "sliderblock2", pnts, -inner/2, inner, "YELLOW",  slider2link2)

	#motionFunc=Variable(self, "motionFunc",  "%f*sin(time/5*(PI/2)/2)"%(dl_-dr_))
	motionFunc=Variable(self, "motionFunc",  "%f+sin(time/5*PI-PI/2)*%f"%((dl_-dr_)/2, (dl_+dr_)/2*_motion))
        #motion=Motion123(self, "sliderMotion", sliderI, self.sliderJ, 'z', "VARVAL(%s)"%motionFunc.name()) 
        #motion=Motion123(self, "sliderMotion", sliderI, self.sliderJ, 'z', "0") 
        transJ=Joint(self, "SliderJoint", sliderI, self.sliderJ, "translational", motion="VARVAL(%s)"%motionFunc.name())

	Variable(self, "Act_forceX", "JOINT(%s, 0, 2, %s)"%(transJ.name(), self.sliderJ.name()))
	Variable(self, "Act_forceY", "JOINT(%s, 0, 3, %s)"%(transJ.name(), self.sliderJ.name()))
	Variable(self, "Act_forceZ", "MOTION(%s, 0, 4, %s)"%(transJ.motionName(), self.sliderJ.name()))
	Measure(self, "ActForce", "MOTION(%s, 0, 4, %s)"%(transJ.motionName(), self.sliderJ.name()))

        link1f=Part(self, "link1f")
        link1f_2_slider=Marker(link1f, "toSlider",  (0,0,inner/2-T/4), ref=slider2link1) 
	slider2link1f=Marker(slider, "slider2link1f", (0, R_, inner/2-T/4), ref=basemar)		
        pos=(-R_*0.866, R_*0.5, inner/2-T/4)
        link1f_2_disk1=Marker(link1f, "todisk1",  pos,  ref=basemar) 
	disk1_2_link1f=Marker(self.mar1.parent(), "tolink1f", pos, ref=baseMarkerI)
        Link(link1f, "linkf", 2*T, T/2, link1f_2_slider, link1f_2_disk1, union=True)

        link1b=Part(self, "link1b")
        link1b_2_slider=Marker(link1b, "toSlider",  (0,0,-inner/2+T/4), ref=slider2link1) 
	slider2link1b=Marker(slider, "slider2link1b", (0, R_, -inner/2+T/4), ref=basemar)		
        pos=(-R_*0.866, R_*0.5, -inner/2+T/4)
        link1b_2_disk1=Marker(link1b, "todisk1",  pos,  ref=basemar) 
	disk1_2_link1b=Marker(self.mar1.parent(), "tolink1b", pos, ref=baseMarkerI)
        Link(link1b, "linkb", 2*T, T/2, link1b_2_slider, link1b_2_disk1)

        self.mar1alignedwithmar2_gnd=Marker(self.mar1.parent(), "basemaralignedwithmar2_gnd",  (0,0,0), (0,0,self.alpha), baseMarkerI)  

	JntSliderLnk1f=Joint(self, "Jslider_link1f", slider2link1f, link1f_2_slider)
	JntDisk1Lnk1f=Joint(self, "Jdisk1_link1f", link1f_2_disk1,  disk1_2_link1f)
	
	JntSliderLnk1b=Joint(self, "Jslider_link1b", slider2link1b, link1b_2_slider)
	JntDisk1Lnk1b=Joint(self, "Jdisk1_link1b", link1b_2_disk1,  disk1_2_link1b)
	Measure(self, "SliderXforceI", "JOINT(%s,1,4,%s)+JOINT(%s,1,4,%s)"%(JntSliderLnk1f.name(), self.sliderJ.name(), JntSliderLnk1b.name(), self.sliderJ.name()))

        link2f=Part(self, "link2f")
        link2b=Part(self, "link2b")
        link22sliderf=Marker(link2f, "toSliderf",   (0,0, inner/2+T/4),ref=slider2link2) 
        slider2link2f=Marker(slider, "tolink2f",   (0,0, inner/2+T/4),ref=slider2link2) 
        #link22sliderb=Marker(link2b, "toSliderb",   (0,0, -inner/2+T-T/4),ref=slider2link2) 
        #slider2link2b=Marker(slider, "tolink2b",   (0,0, -inner/2+T-T/4),ref=slider2link2) 
        link22sliderb=Marker(link2b, "toSliderb",   (0,0, -inner/2-T/4),ref=slider2link2) 
        slider2link2b=Marker(slider, "tolink2b",   (0,0, -inner/2-T/4),ref=slider2link2) 
        ang=-a34(-dl_+dr_, R_)
        angic=-a34(-dl_+dr_*0, R_)
	alpha34= ang/self.d2r-angic/self.d2r
        print ang/self.d2r, angic/self.d2r
        pos=(R_*np.cos(ang), R_*np.sin(ang), inner/2+T/4)
	link2f_2disk2=Marker(link2f, "todiskf", pos, ref=self.mar2)
	disk22link2f=Marker(self.part2,"tolink2f", pos, ref=baseMarkerII)
        pos=(R_*np.cos(ang), R_*np.sin(ang), -inner/2-T/4)
	link2b_2disk2=Marker(link2b, "todiskb", pos, ref=self.mar2)
	disk22link2b=Marker(self.part2,"tolink2b", pos, ref=baseMarkerII)
	
        link2fLnkI=Marker(link2f, "LnkI",   (0,0, inner/2+T/4+T/2),ref=slider2link2) 
        pos=(R_*np.cos(ang), R_*np.sin(ang), inner/2+T/4+T/2)
        link2fLnkJ=Marker(link2f, "LnkJ",   pos ,ref=self.mar2) 
        Link(link2f, "link", 2*T, T/2, link2fLnkI, link2fLnkJ)
        link2bLnkI=Marker(link2b, "LnkI",   (0,0, -inner/2-T/4-T/2),ref=slider2link2) 
        pos=(R_*np.cos(ang), R_*np.sin(ang), -inner/2-T/4-T/2)
        link2bLnkJ=Marker(link2b, "LnkJ",   pos ,ref=self.mar2) 
        Link(link2b, "link", 2*T, T/2, link2bLnkI, link2bLnkJ)

	JntSliderLnk2f=Joint(self, "Jslider_link2f", slider2link2f, link22sliderf)
	JntSliderLnk2b=Joint(self, "Jslider_link2b", slider2link2b, link22sliderb)
	Measure(self, "SliderXforceII", "JOINT(%s, 1, 4, %s)+JOINT(%s, 1,4,%s)"%(JntSliderLnk2f.name(), self.sliderJ.name(),JntSliderLnk2b.name(),  self.sliderJ.name()))
	#restore the aligned line to the zero0 and start from there
	self.Disk2AngleFromAligned=(-shift1-alpha1)+(alpha34-shift2)
	self.shiftedMarCen=Marker(self.part2, "shiftedmarCenter", (0,0,0), (0, 0, self.Disk2AngleFromAligned), ref=self.mar2alignedwithmar1) 
	ll=L1_
	self.distalMarCen=Marker(self.part2, "distalMarCen", (ll, 0, 0), (0,0,0), ref=self.shiftedMarCen)
	rot2=Variable(self, "rot2", "AZ(%s, %s)*RTOD"%(self.shiftedMarCen.name(), self.mar1.name()))
        if quad==1:
            angle_=self.alpha+self.Disk2AngleFromAligned+(-ang)/self.d2r
            angle_ =(90-angle_)*self.d2r
            ll=R_*np.sin(angle_)
            lh=R_*np.cos(angle_)
            pnts=[(1.5*T, 0),(1.5*T+lh, 0), (1.5*T+lh, T), (T, T), (T, -lh-T), (1.5*T+lh, -lh-T), (1.5*T+lh, -lh), (1.5*T, -lh) ]
	self.linkXdisk=Marker(self.part2, "linkXdisk", (ll, 0, 0), (0,0,0), ref=self.shiftedMarCen)
        if quad==1:
            Extrusion(self.part2, "JointHolder", pnts,  -inner/2-T/2-T/2+T, inner+T/2+T/2, "RED", self.linkXdisk)
            self.disk2=Marker(self.part2, "toNext", (lh, -lh/2,  -inner/2), (0, 90,0), self.linkXdisk)
            Extrusion(self.part2, "axis_next", [(T*np.cos(i),T*np.sin(i)) for i in np.radians(np.linspace(0, 350, 10))], -lh/2, lh, "RED", self.disk2) 
	p2=self.part2
        mar2f=Marker(self.part2, "mar2f", (0, 0, inner/2+T/2*0+T/4), ref=self.mar2)
        disk22link2f_=Marker(self.part2, "disk22link2f_", (0,0,T/2*0), ref=disk22link2f)
        linkXdiskf=Marker(self.part2, "linkXdiskf", (0, 0, inner/2+T/2*0+T/4), ref=self.linkXdisk)
	Plate(self.part2, "triangle2f", T, T, (mar2f, disk22link2f_, linkXdiskf)) 
	JntDisk2Lnk2f=Joint(self, "Jdisk2_link2f", link2f_2disk2,  disk22link2f)
        mar2b=Marker(self.part2, "mar2b", (0, 0, -inner/2+T*0-T/4-T/2*0), ref=self.mar2)
        disk22link2b_=Marker(self.part2, "disk22link2b_", (0,0,-T/2*0-T), ref=disk22link2b)
        linkXdiskb=Marker(self.part2, "linkXdiskb", (0, 0, -inner/2-T/2*0-T/4+T*0), ref=self.linkXdisk)
	Plate(self.part2, "triangle2b", T, T, (mar2b, disk22link2b_, linkXdiskb)) 
	JntDisk2Lnk2b=Joint(self, "Jdisk2_link2b", link2b_2disk2,  disk22link2b)
	if ball==1:
	    ballMar=Marker(self.part2, "ballmar", (0, 0, 1.1*braceH/2), ref=self.distalMarCen)
	    Ellipsoid(self.part2, "ball", 90, 90, 90, ballMar)
	Variable(self, "disk2_rot", "AZ(%s, %s)*RTOD"%(self.shiftedMarCen.name(), self.mar2alignedwithmar1.name())) 
	Variable(self, "disk1_rot", "AZ(%s, %s)*RTOD"%(self.mar1.name(), self.mar1alignedwithmar2.name())) 

def Sprocket_profile(R, N):
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
            x=v[0]*cs-v[1]*ss
            y=v[0]*ss+v[1]*cs
            xy.append((x,y))    
        xyr.append(((R-r)*cs, (R-r)*ss))    
    return (xy, xyr)        
        
alpha1=45*2
alpha2=90-alpha1
alpha3=45*0
alpha4=45
scale=1.0
gr=0.8#0.618
gr=1.0
_motion=(1,1,0,0)
basesize=200*scale
conR=basesize/10
halfsize=basesize/2
effDist=basesize-2*conR #basesize*4/5
sp_xy=Sprocket_profile(effDist/3, 30)

T=basesize/20
TT=2*T
R=effDist#basesize-2*conR
dl=1.3448*R
dr=0.9*R
print dl+dr, dl-dr
ll=np.sqrt(500*500.0-R*R)
L=ll-(dl-dr)
model=Model("Robot", mm="mm", mass="kg", force="newton", icon_size=10)
ground=model.ground()
BaseMarker=Marker(ground, "RobotBase", pos=zero3, orientation=(0,-90,0), vis="on")
tempL=(effDist)*6+conR*0
Cylinder(ground, "basedisk", halfsize*np.sqrt(2), basesize*0.05, ref=Marker(ground, "groundDisk", (0,0,-tempL-basesize*0.05*2), ref=BaseMarker), color="WHITE") 
#rotBase
rotBase=Part(model, "rot_base")
rotBaseMarkerI=Marker(rotBase, "baseI",  (0,0,-tempL-basesize*0.05), ref=BaseMarker)
rotBaseMarkerJ=Marker(ground, "groundJ",  (0,0,-tempL-basesize*0.05), ref=BaseMarker)
ActiveJoint1=Joint(model, "firstJ", rotBaseMarkerI, rotBaseMarkerJ)
motion=Motion123(model, "baseMotion", rotBaseMarkerI, rotBaseMarkerJ, 'b3', "0") 
rotdisk=Cylinder(rotBase, "disk", halfsize*np.sqrt(2), basesize*0.05, rotBaseMarkerI) 
##4 half connectors
z2you=Marker(rotBase, "z2you", pos=zero3, orientation=(0,90,0), ref=BaseMarker, vis="on")
beta1=(180-alpha1)/2.0
temp=halfsize-conR
_3pts=[(temp, 0), (temp-2*temp*cos(-alpha1*d2r), -2*temp*sin(-alpha1*d2r)), (-temp,0)]
pns_=[(-temp-conR, -tempL), (-temp+conR, -tempL), (-temp+conR, -4*T), (temp-conR,-4*T), (temp-conR, -tempL), (temp+conR, -tempL)]
pns=pns_+[(temp+conR*np.cos(i), effDist+conR*np.sin(i)) for i in np.radians(np.linspace(0, 90, 5))] 
pns=pns+[(-temp+conR*np.cos(i), effDist+conR*np.sin(i)) for i in np.radians(np.linspace( 90, 180, 5))] 
#distance between two braces:  2*(halfsize-2*T)
distance_between_inner_braces=2*(halfsize-2*T) #basesize*4/5
Extrusion(rotBase, "braceFront1", pns, halfsize-2*T, T, "GREEN", z2you)
Extrusion(rotBase, "braceback1", pns, -halfsize+T, T, "GREEN", z2you)
pns=pns_+[(temp+conR, effDist/2), (0, effDist+conR)]
pns=pns+[(-temp+conR*np.cos(i), effDist+conR*np.sin(i)) for i in np.radians(np.linspace( 90, 180, 5))] 
Extrusion(rotBase, "braceFront2", pns, halfsize-2*T+T, T, "GREEN", z2you)
pns_=[(-temp-conR, -tempL), (-temp+conR, -tempL), (-temp+conR, -4*T), (temp-conR,-4*T), (temp-conR, -tempL), (temp+conR, -tempL), (temp+conR, -2*T), (-temp-conR, -2*T)]
Extrusion(rotBase, "braceback2", pns_, -halfsize+0, T, "GREEN", z2you)

braceFR=Marker(rotBase, "braceFR", (_3pts[0][0], _3pts[0][1], halfsize-2*T+T), (0, 0, 0), ref=z2you, vis="on") 
braceFU=Marker(rotBase, "braceFU", (_3pts[1][0], _3pts[1][1], halfsize-2*T+T), (0, 0, 0), ref=z2you, vis="on") 
braceFL=Marker(rotBase, "braceFL", (_3pts[2][0], _3pts[2][1], halfsize-2*T+T), (0, 0, 0), ref=z2you, vis="on") 
#
braceBR=Marker(rotBase, "braceBR", (_3pts[0][0], _3pts[0][1], -halfsize+T), (0, 0, -alpha1*0), ref=z2you, vis="on") 
Cylinder(rotBase, "cynBR", conR/2, distance_between_inner_braces+2*T, ref=braceBR) 
braceBU=Marker(rotBase, "braceBU", (_3pts[1][0], _3pts[1][1], -halfsize+T), (0, 0, -alpha1*0), ref=z2you, vis="on") 
braceBL=Marker(rotBase, "braceBL", (_3pts[2][0], _3pts[2][1], -halfsize+T), (0, 0, 0), ref=z2you, vis="on") 
#
disk1_mar=Marker(rotBase, "disk_cne_mar", (basesize/2-conR, 0, 0.45*R*0), (0, 0, 90-alpha1), ref=z2you, vis="on")
lm11=SliderMechanismLean(model, "SLM11", dl, dr, L, L, R, disk1_mar, 90-alpha1, 0, 89.99, _motion=_motion[0], inner=distance_between_inner_braces)

angleAlignedLine=lm11.FrameAngle
angleFromAbligned=lm11.Disk2AngleFromAligned
angleAlignedFromLevel=90-alpha1+angleAlignedLine

ll=np.sqrt(R*R+(L+dl-dr)*(L+dl-dr))
brace2ParaLnk=Marker(rotBase, "brace2Paralnk1",  (0, 0, T/4), ref=braceFU)
ParaLnk11=Part(model, "ParaLnk11")
ParaLnk11MarI=Marker(ParaLnk11, "ParaLnk11I", ref=brace2ParaLnk)
JParaLnk11_rotbase=Joint(model, "JParaLnk11_rotbase", brace2ParaLnk, ParaLnk11MarI) #ParaLnk1 2 Base
dxyz1=[ll*np.cos(angleAlignedLine*d2r), ll*np.sin(angleAlignedLine*d2r)]
ParaLnk11Mar2=Marker(ParaLnk11, "ParaLnk11Mar2", (dxyz1[0], dxyz1[1], T/4), ref=braceFU)
Link(ParaLnk11, "link", 2*T, T/2, ParaLnk11MarI, ParaLnk11Mar2, union=True)


ParaLnk12=Part(model, "ParaLnk12")
braceToLnk2Mar=Marker(rotBase, "braceToLnk2Mar", (0,0,-T/4), ref=braceBL) 
Lnk2ToBrace=Marker(ParaLnk12, "Lnk2ToBrace", ref=braceToLnk2Mar) 
Joint(model, "paralnk2_brace", Lnk2ToBrace, braceToLnk2Mar)
Lnk2ToPlate90=Marker(ParaLnk12, "Lnk2ToPlate90", (dxyz1[0], dxyz1[1], -T/4), ref=braceBL)
Link(ParaLnk12, "link", 2*T, T/2, Lnk2ToBrace, Lnk2ToPlate90, union=True)

firstPlate=Part(model, "firstPlate")
firstPmar1=Marker(firstPlate, "firstPmar1",          (dxyz1[0], dxyz1[1], T/2-T+T/4), ref=braceFU)
plate_2_paralnk11=Marker(ParaLnk11, "lnk11_2_plate", (dxyz1[0], dxyz1[1],  -T/2+T/4), ref=braceFU)
J1stPlate_Lnk11=Joint(model, "J1stPlate_Lnk11", firstPmar1, plate_2_paralnk11)

firstPmar2=Marker(firstPlate, "firstPmar2",       (dxyz1[0],dxyz1[1]-effDist, -T/2+T/4), ref=braceFU)
lm11toPlate_3=Marker(lm11.Brace, "lm11toPlate_3", (dxyz1[0], dxyz1[1]-effDist,-T/2+T/4), ref=braceFU)
J1stPlate_Paralnk1=Joint(model, "J1stPlate_Paralnk1", firstPmar2, lm11toPlate_3)
Link(firstPlate, "plate", 2*T, T/2, firstPmar1, firstPmar2, union=True)


firstPlate90=firstPlate
firstPmar1_90=Marker(firstPlate90, "firstPmar1_90", (dxyz1[0], dxyz1[1], T/2-T/4),  ref=braceBL)
firstPmar2_90=Marker(firstPlate90, "firstPmar2_90", (effDist, 0, 0),  ref=firstPmar1_90)

pnt=[(T,-T)]+[(T*np.cos(i), effDist+T*np.sin(i)) for i in np.radians(np.linspace(0, 180, 10))]+[(-T, T)]
pnt=pnt+[(-effDist+T*np.cos(i), T*np.sin(i)) for i in np.radians(np.linspace(90, 270, 10))]

Link(firstPlate90, "plate90", 2*T, T/2, firstPmar1_90, firstPmar2_90, union=True)

plate1_90_toLnk12=Marker(firstPlate90, "plate1_90_toLnk12", ref=Lnk2ToPlate90)
Joint(model, "paraLink2_Plate90", Lnk2ToPlate90, plate1_90_toLnk12)
lm11brace2plate90=Marker(lm11.Brace, "lm11brace2plate90", (dxyz1[0], dxyz1[1], T/2-T/4), ref=braceBR) 
Joint(model, "lm11_disk2_toPlate90", firstPmar2_90, lm11brace2plate90)

angle2=angleAlignedFromLevel+angleFromAbligned
dxyz2=[L*np.cos(angle2*d2r), L*np.sin(angle2*d2r)]
ParaLnk21=Part(model, "ParaLnk21")
Lnk21Mar1=Marker(ParaLnk21, "Lnk21Mar1", (dxyz1[0],dxyz1[1],T/4+T/2), (0,0,angle2), ref=braceFU)
Lnk11To21=Marker(ParaLnk11, "Lnk11Mar1_", (dxyz1[0],dxyz1[1],T/4+T/2),    (0,0,angle2), ref=braceFU)
Joint(model, "Lnk21_11", Lnk21Mar1, Lnk11To21)
Lnk21Mar2=Marker(ParaLnk21, "Lnk21Mar2", (L, 0, 0), (0,0,-angle2), ref=Lnk21Mar1)
Link(ParaLnk21, "link", 2*T, T/2, Lnk21Mar1, Lnk21Mar2, union=True)

ParaLnk22=Part(model, "ParaLnk22")
Lnk22Mar1=Marker(ParaLnk22, "Lnk22Mar1", (dxyz1[0], dxyz1[1],-T/2-T/4), (0,0,angle2), ref=braceBL)
Lnk12To22=Marker(ParaLnk12, "Lnk12To22", (dxyz1[0], dxyz1[1],-T/2-T/4), (0,0,angle2), ref=braceBL)
Joint(model, "Lnk22_12", Lnk22Mar1, Lnk12To22)
Lnk22Mar2=Marker(ParaLnk22, "Lnk21Mar2", (L,0,0), (0,0,-angle2), ref=Lnk22Mar1)
Link(ParaLnk22, "link", 2*T, T/2, Lnk22Mar1, Lnk22Mar2, union=True)

secPlate=Part(model, "secPlate")
secPlate90=secPlate#Part(model, "secPlate90")
x=dxyz1[0]+dxyz2[0]
y=dxyz1[1]+dxyz2[1]
secPlateMar=Marker(secPlate, "secPlatemar", (x, y, T/4), ref=braceFR)
lm11_2_secplate=Marker(lm11.part2, "lm11_2_secplate", (x, y, T/4), ref=braceFR)
Joint(model, "secPlate_lm11_part2", secPlateMar, lm11_2_secplate)
secPlateMar1=Marker(secPlate, "secPlatemar1I", (x, y+effDist, T/4), ref=braceFR)
secPlateMar1J=Marker(ParaLnk21, "secPlatemar1J", (x, y+effDist, T/4), ref=braceFR)
Joint(model, "secPlate_ParaLnk21", secPlateMar1, secPlateMar1J)
Link(secPlate, "link", 2*T, T/2, secPlateMar, secPlateMar1, union=True)

secPlateMar90=Marker(secPlate90, "secPlatemar90", (x+effDist, y, -T/4), ref=braceBL)
lm11_2_secplate90=Marker(lm11.part2, "lm11_2_secplate90", (x+effDist,y, -T/4), ref=braceBL)
Joint(model, "secPlate90_lm11_patt2", secPlateMar90, lm11_2_secplate90)
secPlateMar90_1=Marker(secPlate90, "secPlatemar90_1I", (x, y, -T/4), ref=braceBL)
secPlateMar90_1J=Marker(ParaLnk22, "secPlatemar90_1J", (x, y, -T/4), ref=braceBL)
Joint(model, "secPlate90_ParaLnk22", secPlateMar90_1, secPlateMar90_1J)
Link(secPlate90, "link90", 2*T, T/2, secPlateMar90, secPlateMar90_1, union=True)


Cylinder(secPlate, "Cyn1", T, distance_between_inner_braces+3*T, ref=secPlateMar90)
disk2_mar=Marker(secPlate, "disk2_mar", (0,0,distance_between_inner_braces/2+T+T/2), ref=secPlateMar90)
secPlateMar1f=Marker(secPlate, "secPlateMar1f", (0,0,distance_between_inner_braces*gr/2-T+T/4), ref=disk2_mar)
secPlateMar2f=Marker(secPlate, "secPlateMar2f", (0, effDist*gr/2,0), ref=secPlateMar1f)
secPlateMar3f=Marker(secPlate, "secPlateMar3f", (-effDist*gr, effDist*gr/2,0), ref=secPlateMar1f)
secPlateMar4f=Marker(secPlate, "secPlateMar4f", (-effDist*gr, 0,0), ref=secPlateMar1f)
Plate(secPlate, "platef", T/2, T/2, (secPlateMar1f, secPlateMar2f, secPlateMar3f, secPlateMar4f))
secPlateMar1b=Marker(secPlate, "secPlateMar1b", (0,0,-distance_between_inner_braces*gr/2+T/4+T/2), ref=disk2_mar)
secPlateMar2b=Marker(secPlate, "secPlateMar2b", (0, effDist*gr/2,0), ref=secPlateMar1f)
secPlateMar3b=Marker(secPlate, "secPlateMar3b", (-effDist*gr, effDist*gr/2,0), ref=secPlateMar1f)
secPlateMar4b=Marker(secPlate, "secPlateMar4b", (-effDist*gr, 0,0), ref=secPlateMar1f)
Plate(secPlate, "plateb", T/2, T/2, (secPlateMar1b, secPlateMar2b, secPlateMar3b, secPlateMar4b))
lm12=SliderMechanismLean(model, "SLM12", dl*gr, dr*gr, L*gr, L*gr, R*gr, disk2_mar, 0, 0, 89.99, _motion=_motion[1], inner=distance_between_inner_braces*gr)

angleAlignedLine2=lm12.FrameAngle
angleFromAbligned2=lm12.Disk2AngleFromAligned
angleAlignedFromLevel2=90-alpha1+angleAlignedLine2


ll1=np.sqrt(R*R*gr*gr+(L*gr+dl*gr-dr*gr)*(L*gr+dl*gr-dr*gr))
dxyz3=[ll1*np.cos(angleAlignedLine2*d2r), ll1*np.sin(angleAlignedLine2*d2r)]
angle4=angleAlignedFromLevel2+angleFromAbligned2
dxyz4=[L*np.cos(angle4*d2r), L*np.sin(angle4*d2r)]
ParaLnk31=Part(model, "ParaLnk31")
ParaLnk31Mar1=Marker(ParaLnk31, "ParaLnk31Mar1", (dxyz1[0]+dxyz2[0], dxyz1[1]+dxyz2[1], T/2+T/2+T/4),ref=braceFU) 
ParaLnk31Mar1J=Marker(secPlate, "ParaLnk31Mar1_secPlate", (dxyz1[0]+dxyz2[0], dxyz1[1]+dxyz2[1], T/2+T/2+T/4),ref=braceFU) 
Joint(model, "ParaLnk31_secPlate", ParaLnk31Mar1, ParaLnk31Mar1J)
ParaLnk31Mar2=Marker(ParaLnk31, "ParaLnk31Mar2", (dxyz1[0]+dxyz2[0]+dxyz3[0], dxyz1[1]+dxyz2[1]+dxyz3[1], T/2+T/2+T/4),ref=braceFU) 
Link(ParaLnk31, "link", 2*T, T/2, ParaLnk31Mar1, ParaLnk31Mar2, union=True)

ParaLnk32=Part(model, "ParaLnk32")
ParaLnk32Mar1=Marker(ParaLnk32, "ParaLnk32Mar1",          (dxyz1[0]+dxyz2[0], dxyz1[1]+dxyz2[1], -(T/2+T/2)-T/4),ref=braceBL) 
ParaLnk32Mar1J=Marker(secPlate, "ParaLnk32Mar1_secPlate", (dxyz1[0]+dxyz2[0], dxyz1[1]+dxyz2[1], -(T/2+T/2)-T/4),ref=braceBL)  
Joint(model, "ParaLnk32_secPlate", ParaLnk32Mar1, ParaLnk32Mar1J)
ParaLnk32Mar2=Marker(ParaLnk32, "ParaLnk32Mar2", (dxyz3[0], dxyz3[1], 0), ref=ParaLnk32Mar1)
Link(ParaLnk32, "link", 2*T, T/2, ParaLnk32Mar1, ParaLnk32Mar2, union=True)

trdPlate=Part(model, "trdePlate")
trdPlateLnkFMar1= Marker(trdPlate,  "trdPlateLnkFMar1",  (dxyz1[0]+dxyz2[0]+dxyz3[0], dxyz1[1]+dxyz2[1]+dxyz3[1], T/2+T/2+T/4-T),ref=braceFU) 
trdPlateLnkFMar1J=Marker(ParaLnk31, "trdPlateLnkFMar1", (dxyz1[0]+dxyz2[0]+dxyz3[0], dxyz1[1]+dxyz2[1]+dxyz3[1], T/2+T/2+T/4-T),ref=braceFU) 
Joint(model, "trdPlate_paraLnk31",trdPlateLnkFMar1, trdPlateLnkFMar1J)
trdPlateLnkFMar2= Marker(trdPlate,  "trdPlateLnkFMar2",   (dxyz1[0]+dxyz2[0]+dxyz3[0], dxyz1[1]+dxyz2[1]+dxyz3[1]-effDist, T/2+T/2+T/4-T),ref=braceFU) 
trdPlateLnkFMar2J=Marker(lm12.part2, "trdPlateLnkFMar2J", (dxyz1[0]+dxyz2[0]+dxyz3[0], dxyz1[1]+dxyz2[1]+dxyz3[1]-effDist, T/2+T/2+T/4-T),ref=braceFU)
Joint(model, "trdPlatef_lm12_disk2", trdPlateLnkFMar2, trdPlateLnkFMar2J)
Link(trdPlate, "linkf", 2*T, T/2, trdPlateLnkFMar1, trdPlateLnkFMar2, union=True)

trdPlateLnkBMar1=Marker(trdPlate, "trdPlateLnkBMar1", (dxyz1[0]+dxyz2[0]+dxyz3[0], dxyz1[1]+dxyz2[1]+dxyz3[1], -T/2*0-T/4), ref=braceBL)
trdPlate2Paralnk32=Marker(ParaLnk32, "trdPlateLnkBMar1", (0, 0, T), ref=ParaLnk32Mar2)
Joint(model, "trdPlate_ParaLnk32", trdPlateLnkBMar1, trdPlate2Paralnk32)
trdPlateLnkBMar2=Marker(trdPlate, "trdPlateLnkBMar2", (dxyz1[0]+dxyz2[0]+dxyz3[0]+effDist, dxyz1[1]+dxyz2[1]+dxyz3[1], -T/2*0-T/4), ref=braceBL)
trdPlateLnkBMar2J=Marker(lm12.part2, "trdPlateLnkBMar2J", (dxyz1[0]+dxyz2[0]+dxyz3[0]+effDist, dxyz1[1]+dxyz2[1]+dxyz3[1], -T/2*0-T/4), ref=braceBL)
Joint(model, "trdPlateb_lm12_disk2", trdPlateLnkBMar2, trdPlateLnkBMar2J)
Link(trdPlate, "linkb", 2*T, T/2, trdPlateLnkBMar1, trdPlateLnkBMar2, union=True)
x2=dxyz1[0]+dxyz2[0]+dxyz3[0]+dxyz4[0]
y2=dxyz1[1]+dxyz2[1]+dxyz3[1]+dxyz4[1]
x1=dxyz1[0]+dxyz2[0]+dxyz3[0]
y1=dxyz1[1]+dxyz2[1]+dxyz3[1]


ParaLnk41=Part(model, "ParaLnk41")
ParaLnk41Mar1=Marker(ParaLnk41, "ParaLnk41Mar1", (x1, y1, T/4+T/2), ref=braceFU)
ParaLnk31_41=Marker(ParaLnk31, "ParaLnk31_41", (x1, y1, T/2+T/4), ref=braceFU)
Joint(model, "ParaLnk31_ParaLnk41", ParaLnk41Mar1, ParaLnk31_41)
ParaLnk41Mar2=Marker(ParaLnk41, "ParaLnk41Mar2", (x2, y2, T/2+T/4), ref=braceFU)
Link(ParaLnk41, "link", 2*T, T/2, ParaLnk41Mar1, ParaLnk41Mar2, union=True)

ParaLnk42=Part(model, "ParaLnk42")
ParaLnk42Mar1=Marker(ParaLnk42, "ParaLnk42Mar1", (x1, y1, -T/2-T/4), ref=braceBL)
ParaLnk32_42=Marker(ParaLnk32, "ParaLnk32_42", (x1, y1, -T/2-T/4), ref=braceBL)
Joint(model, "ParaLnk32_ParaLnk42", ParaLnk42Mar1, ParaLnk32_42)
ParaLnk42Mar2=Marker(ParaLnk42, "ParaLnk42Mar2", (x2, y2, -T/2-T/4), ref=braceBL)
Link(ParaLnk42, "link", 2*T, T/2, ParaLnk42Mar1, ParaLnk42Mar2, union=True)

fthPlate=Part(model, "fthPlate")
CynBase=Marker(fthPlate, "CynBase", (x2, y2, -distance_between_inner_braces/2-T), ref=disk1_mar)
Cylinder(fthPlate, "cyn", T/2,  distance_between_inner_braces+2*T, CynBase)

fthPlateFmar1=Marker(fthPlate, "fthPlateFmar1", (x2, y2, T/4), ref=braceFU)
ParaLnk41_fthPlate_mar=Marker(ParaLnk41, "Lnk41_fthPalte",  (x2, y2, T/4), ref=braceFU)
Joint(model, "ParaLnk41_fthPlate", fthPlateFmar1, ParaLnk41_fthPlate_mar)
fthPlateFmar2=Marker(fthPlate, "fthPlateFmar2", (0, -effDist, 0), ref=fthPlateFmar1)
Link(fthPlate, "linkf", 2*T, T/2, fthPlateFmar1, fthPlateFmar2, union=True)

fthPlateBmar1=Marker(fthPlate, "fthPlateBmar1", (x2, y2, -T/4), ref=braceBL)
ParaLnk42_fthPlate_mar=Marker(ParaLnk42, "Lnk42_fthPalte", (x2, y2, -T/4), ref=braceBL)
Joint(model, "ParaLnk42_fthPlate", fthPlateBmar1, ParaLnk42_fthPlate_mar)
fthPlateBmar2=Marker(fthPlate, "fthPlateBmar2", (effDist+x2, y2, -T/4), ref=braceBL)
Link(fthPlate, "linkb", 2*T, T/2, fthPlateBmar1, fthPlateBmar2, union=True)
fthPlateBmar3=Marker(fthPlate, "fthPlateBmar3", (effDist+x2, effDist+y2, -T/4), ref=braceBL)
Link(fthPlate, "linkb_up", 2*T, T/2, fthPlateBmar3, fthPlateBmar2, union=True)

CynCenter1=Marker(fthPlate, "cyn_center1", zero3, (0, 0, 0), ref=lm12.distalMarCen)
Joint(model, "fthPlate_lm12_disk2", lm12.distalMarCen, CynCenter1)
CynCenter2=Marker(fthPlate, "cyn_center2", zero3, (-angle4, -90, 0), ref=lm12.distalMarCen)
Center2=Marker(fthPlate, "center2", (0, 0,distance_between_inner_braces/2) , ref=CynCenter2)

gr=0.618

Extrusion(fthPlate, "cyn1", [(T*np.cos(i), T*np.sin(i)) for i in np.radians(np.linspace(0, 350, 10))], T/4, distance_between_inner_braces+2*T, ref=fthPlateBmar3)

cyn2_base=Marker(fthPlate, "cyn2_base", (effDist*gr, -distance_between_inner_braces*gr/2, effDist/2), ref=CynCenter2)
Extrusion(fthPlate, "cyn2", [(T*np.cos(i), T*np.sin(i)) for i in np.radians(np.linspace(0, 350, 10))], -(distance_between_inner_braces*gr/2-T*gr*0), distance_between_inner_braces*gr-2*T*gr*0, ref=cyn2_base)
disk3_mar=Marker(fthPlate, "disk3_mar", (0, 0, 0), ref=cyn2_base) 
TTT=T
pnts=[(0, distance_between_inner_braces/2+TTT), (effDist*gr+T, distance_between_inner_braces/2+TTT), (effDist*gr+T, -distance_between_inner_braces/2-TTT), (0, -distance_between_inner_braces/2-TTT)]
Extrusion(fthPlate, "plate4", pnts, distance_between_inner_braces/2*gr, T, ref=Center2)
Extrusion(fthPlate, "plate5", pnts, -distance_between_inner_braces/2*gr-T, T, ref=Center2)

ratio=1
ratio=0.95/np.sqrt(2*1.3)*np.sqrt(2.0)
LL=150*1.3
LL1=LL*1.4
h=effDist*0.6/2.0
RR1=260/np.sqrt(4)*ratio
_dxyz1=[-i*LL1/ll for i in dxyz1]+[0]
_dxyz2=[-i*LL/L for i in dxyz2]+[0]
_dxyz3=[-i*LL/ll1 for i in dxyz3]+[0]
_dxyz4=[-i*LL/L for i in dxyz4]+[0]

pnts=[(-lm11.r, lm11.r), (-lm11.r, lm11.braceH+lm11.r)]
x_=-LL1*np.cos(lm11.alpha*d2r)
y_=-LL1*np.sin(lm11.alpha*d2r)
pnts=pnts+[(x_+effDist/2.0*np.cos(i), y_+effDist/2.0*np.sin(i)) for i in np.linspace(90+lm11.alpha, 270+lm11.alpha, 10)*d2r]
Extrusion(lm11.Brace, "connectingPlate1", pnts, 2*h*0.46, lm11.width/2-2*h*0.46, "GREEN", ref=lm11.BaseMar)
Extrusion(lm11.Brace, "connectingPlate2", pnts, -lm11.width/2, lm11.width/2-2*h*0.46, "GREEN", ref=lm11.BaseMar)
#
ballMar=Marker(lm11.Brace, "counterBalance", _dxyz1,  (angleAlignedFromLevel+angleFromAbligned, 0,0), ref=disk1_mar)

balance2=Part(model, "balenace2")
RR2=145/np.sqrt(4)*ratio#*np.sqrt(1/0.6)
ballMar2=Marker(balance2, "ballMar2", [_dxyz1[i]+_dxyz2[i] for i in range(3)], (angleAlignedFromLevel+angleFromAbligned, 0,0), ref=disk1_mar)

RR1=RR1*0.9#*1.35
RR2=RR2*0.9#*1.6
pts=[(RR1*np.cos(i)+LL, RR1*np.sin(i)) for i in np.linspace(-90, 90, 30)*d2r]
pts=pts+[(RR2*np.cos(i), RR2*np.sin(i)) for i in np.linspace(90, 270, 30)*d2r]
Extrusion(balance2, "cyn2", pts, -2*h*0.46, 4*h*0.46, "GREEN", ref=ballMar2)


balance2_spmar=Marker(balance2, "sp_mar", _dxyz1, ref=disk1_mar)
lm11_part2_spmar=Marker(lm11.part2, "spmar", (dxyz1[0], dxyz1[1], 0), ref=disk1_mar)
Joint(model, "ParallelMotion1_1", balance2_spmar, lm11_part2_spmar, "orientation", _jprim=1)
balance2_spmarp1=Marker(balance2, "sp_marp1", (0, 0,lm11.width/2+5), ref=balance2_spmar)
Extrusion(balance2, "sprocket1", sp_xy[1], -5, 1, ref=balance2_spmarp1)
Extrusion(balance2, "sprocket2", sp_xy[0], -4, 8, ref=balance2_spmarp1)
Extrusion(balance2, "sprocket3", sp_xy[1], 4, 1, ref=balance2_spmarp1)
balance2_spmarn1=Marker(balance2, "sp_marn1", (0, 0,-lm11.width/2-5), ref=balance2_spmar)
Extrusion(balance2, "sprocket4", sp_xy[1], -5, 1, ref=balance2_spmarn1)
Extrusion(balance2, "sprocket5", sp_xy[0], -4, 8, ref=balance2_spmarn1)
Extrusion(balance2, "sprocket6", sp_xy[1], 4, 1, ref=balance2_spmarn1)

lm11_part2_spmarp1=Marker(lm11.part2, "spmarp1", [0,dxyz1[1]*0,lm11.width/2+5], ref=lm11_part2_spmar)
Extrusion(lm11.part2, "sprocket1", sp_xy[1], -5, 1, ref=lm11_part2_spmarp1)
Extrusion(lm11.part2, "sprocket2", sp_xy[0], -4, 8, ref=lm11_part2_spmarp1)
Extrusion(lm11.part2, "sprocket3", sp_xy[1], 4, 1, ref=lm11_part2_spmarp1)

lm11_part2_spmarn1=Marker(lm11.part2, "spmarn1", (0,0,-lm11.width/2-5), ref=lm11_part2_spmar)

Extrusion(lm11.part2, "sprocket4", sp_xy[1], -5, 1, ref=lm11_part2_spmarn1)
Extrusion(lm11.part2, "sprocket5", sp_xy[0], -4, 8, ref=lm11_part2_spmarn1)
Extrusion(lm11.part2, "sprocket6", sp_xy[1], 4, 1, ref=lm11_part2_spmarn1)


Jbal1=Joint(model, "J_lm11_bal2", ballMar, Marker(balance2, "toLm11", ref=ballMar)) 

RR3=225/np.sqrt(4)*ratio
balance3=Part(model, "balance3")
ballMar3=Marker(balance3, "ballMar3", [_dxyz1[i]+_dxyz2[i] for i in range(3)], (angleAlignedFromLevel2, 0, 0), ref=disk1_mar)
marker3_2=Marker(balance3, "marker3_2", ref=ballMar2)
Jbal2=Joint(model, "bal2_3", marker3_2, ballMar2)

balance4=Part(model, "balance4")
ballMar3_=Marker(balance3, "ballMar3_", [_dxyz1[i]+_dxyz2[i]+_dxyz3[i] for i in range(3)], (angleAlignedFromLevel2, 0, 0), ref=disk1_mar)
ballMar4=Marker(balance4,  "ballMar4",  [_dxyz1[i]+_dxyz2[i]+_dxyz3[i] for i in range(3)], (angleAlignedFromLevel2, 0, 0), ref=disk1_mar)
Jbal3=Joint(model, "bal3_4", ballMar4, ballMar3_)
ra=1.4
pnts=[(LL+RR3*.5*ra*np.cos(i), RR3*.5*ra*np.sin(i)) for i in np.linspace(-90, 90, 30)*d2r]
pnts=pnts+[(RR3*ra*np.cos(i), RR3*ra*np.sin(i)) for i in np.linspace(90, 270, 30)*d2r]
h_=h*0.485
Extrusion(balance3, "cyn1", pnts, 2*h*0.46, 4*h_*(0.8-0.46)/2, "GREEN", ref=ballMar3_)
Extrusion(balance3, "cyn2", pnts, -2*h*0.46-4*h_*(0.8-0.46)/2, 4*h_*(0.8-0.46)/2, "GREEN", ref=ballMar3_)

RR4=210/np.sqrt(4)*ratio*1.45
ballMar4_=Marker(balance4, "counterbalance4", [_dxyz1[i]+_dxyz2[i]+_dxyz3[i]+_dxyz4[i] for i in range(3)], (angleAlignedFromLevel2+angleFromAbligned,0,0), ref=disk1_mar)  
#Coupler(model, "parallelMotion3", (lm12.revJoint2, Jbal3), (1,-1))  
RR3=RR3*1.0
RR4=RR4*1.0
pts=[(RR3*np.cos(i)+LL, RR3*np.sin(i)) for i in np.linspace(-90, 90, 30)*d2r]
pts=pts+[(RR4*np.cos(i), RR4*np.sin(i)) for i in np.linspace(90, 270, 30)*d2r]
Extrusion(balance4, "cyn", pts, -2*h*0.46, 4*h*0.46, "GREEN", ref=ballMar4_)


lm12_spmar=Marker(lm12.Brace, "lm12_spmar", (dxyz1[0]+dxyz2[0], dxyz1[1]+dxyz2[1], 0), ref=disk1_mar) 
lm12_spmarp2=Marker(lm12.Brace, "lm12_spmarp2", (0,0,10+lm12.width/2+5), ref=lm12_spmar)
Extrusion(lm12.Brace, "sprocket1", sp_xy[1], -5, 1, ref=lm12_spmarp2)
Extrusion(lm12.Brace, "sprocket2", sp_xy[0], -4, 8, ref=lm12_spmarp2)
Extrusion(lm12.Brace, "sprocket3", sp_xy[1], 4, 1, ref=lm12_spmarp2)


part_idler12=Part(model, "idler12")
idler12_mar=Marker(part_idler12, "idler12_mar", (dxyz1[0],dxyz1[1],0),  ref=disk1_mar)
idler12_marJ=Marker(lm11.part2, "idler12_marJ", (dxyz1[0],dxyz1[1],0),  ref=disk1_mar)
Joint(model, "idler12J", idler12_mar, idler12_marJ)
idler12_marp2=Marker(part_idler12, "spmarp2", (0, 0, 10+lm12.width/2+5),ref=idler12_mar) 
Extrusion(part_idler12, "sprocket1", sp_xy[1], -5, 1, ref=idler12_marp2)
Extrusion(part_idler12, "sprocket2", sp_xy[0], -4, 8, ref=idler12_marp2)
Extrusion(part_idler12, "sprocket3", sp_xy[1], 4, 1, ref=idler12_marp2)
idler12_marp3=Marker(part_idler12, "spmarp3", (0, 0, 20+lm12.width/2+5),ref=idler12_mar) 
Extrusion(part_idler12, "sprocket4", sp_xy[1], -5, 1, ref=idler12_marp3)
Extrusion(part_idler12, "sprocket5", sp_xy[0], -4, 8, ref=idler12_marp3)
Extrusion(part_idler12, "sprocket6", sp_xy[1], 4, 1, ref=idler12_marp3)

Joint(model, "ParallelMotion2_1", lm12_spmar, idler12_mar, "orientation", _jprim=1)

part_idler11=Part(model, "idler11")
idler11_mar=Marker(part_idler11, "idler11_mar", ref=balance2_spmar)
Joint(model, "idler11J", idler11_mar, balance2_spmar)
idler11_marp2=Marker(part_idler11, "idler11_marp2", (0,0, 10+lm11.width/2+5), ref=balance2_spmar)
Extrusion(part_idler11, "sprocket1", sp_xy[1], -5, 1, ref=idler11_marp2)
Extrusion(part_idler11, "sprocket2", sp_xy[0], -4, 8, ref=idler11_marp2)
Extrusion(part_idler11, "sprocket3", sp_xy[1], 4, 1, ref=idler11_marp2)
idler11_marp3=Marker(part_idler11, "idler11_marp3", (0,0, 20+lm11.width/2+5), ref=balance2_spmar)
Extrusion(part_idler11, "sprocket4", sp_xy[1], -5, 1, ref=idler11_marp3)
Extrusion(part_idler11, "sprocket5", sp_xy[0], -4, 8, ref=idler11_marp3)
Extrusion(part_idler11, "sprocket6", sp_xy[1], 4, 1, ref=idler11_marp3)

Joint(model, "ParallelMotion2_2", idler12_mar, idler11_mar, "orientation", _jprim=1)

balance3_spmar=Marker(balance3, "sp_mar", [_dxyz1[i]+_dxyz2[i] for i in range(3)], (0, 0, 0), ref=disk1_mar)
balance3_marp2=Marker(balance3, "sp_marp2", (0,0,10+lm11.width/2+5), ref=balance3_spmar)
Extrusion(balance3, "sprocket1", sp_xy[1], -5, 1, ref=balance3_marp2)
Extrusion(balance3, "sprocket2", sp_xy[0], -4, 8, ref=balance3_marp2)
Extrusion(balance3, "sprocket3", sp_xy[1], 4, 1, ref=balance3_marp2)

Joint(model, "ParallelMotion2_3", idler11_mar, balance3_spmar, "orientation", _jprim=1)


lm12_part2_spmar=Marker(lm12.part2, "part2_spmar", (dxyz1[0]+dxyz2[0]+dxyz3[0], dxyz1[1]+dxyz2[1]+dxyz3[1], 0), ref=disk1_mar) 
lm12_part2_spmarn1=Marker(lm12.part2, "spmarn1", (0,0,-lm12.width/2-5), ref=lm12_part2_spmar)
Extrusion(lm12.part2, "sprocket4", sp_xy[1], -5, 1, ref=lm12_part2_spmarn1)
Extrusion(lm12.part2, "sprocket5", sp_xy[0], -4, 8, ref=lm12_part2_spmarn1)
Extrusion(lm12.part2, "sprocket6", sp_xy[1], 4, 1, ref=lm12_part2_spmarn1)

idler24_part=Part(model, "idler24")
idler24_mar=Marker(idler24_part, "idler24_marI", (dxyz1[0]+dxyz2[0],dxyz1[1]+dxyz2[1],0), ref=disk1_mar)
Joint(model, "idler24J", idler24_mar, lm12_spmar)
idler24_marn2=Marker(idler24_part, "spmarn2", (0, 0, -10-lm12.width/2-5),ref=idler24_mar) 
Extrusion(idler24_part, "sprocket1", sp_xy[1], -5, 1, ref=idler24_marn2)
Extrusion(idler24_part, "sprocket2", sp_xy[0], -4, 8, ref=idler24_marn2)
Extrusion(idler24_part, "sprocket3", sp_xy[1], 4, 1, ref=idler24_marn2)
idler24_marn1=Marker(idler24_part, "spmarn1", (0, 0, -lm12.width/2-5),ref=idler24_mar) 
Extrusion(idler24_part, "sprocket4", sp_xy[1], -5, 1, ref=idler24_marn1)
Extrusion(idler24_part, "sprocket5", sp_xy[0], -4, 8, ref=idler24_marn1)
Extrusion(idler24_part, "sprocket6", sp_xy[1], 4,  1, ref=idler24_marn1)

Joint(model, "ParallelMotion3_1", idler24_mar, lm12_part2_spmar, "orientation", _jprim=1)


part_idler23=Part(model, "idler23")
idler23_mar=Marker(part_idler23, "idler23_mar", (dxyz1[0],dxyz1[1],0), ( angleAlignedLine2*0,0,0), ref=disk1_mar)
Joint(model, "idler23J", idler23_mar, idler12_marJ)
idler23_marn2=Marker(part_idler23, "idler23_marn2", (0,0, -10-lm11.width/2-5), ref=idler23_mar)
Extrusion(part_idler23, "sprocket1", sp_xy[1], -5, 1, ref=idler23_marn2)
Extrusion(part_idler23, "sprocket2", sp_xy[0], -4, 8, ref=idler23_marn2)
Extrusion(part_idler23, "sprocket3", sp_xy[1], 4, 1, ref=idler23_marn2)
idler23_marn3=Marker(part_idler23, "idler23_marn3", (0,0, -20-lm11.width/2-5), ref=idler23_mar)
Extrusion(part_idler23, "sprocket4", sp_xy[1], -5, 1, ref=idler23_marn3)
Extrusion(part_idler23, "sprocket5", sp_xy[0], -4, 8, ref=idler23_marn3)
Extrusion(part_idler23, "sprocket6", sp_xy[1], 4, 1, ref=idler23_marn3)

Joint(model, "ParallelMotion3_2", idler23_mar, idler24_mar, "orientation", _jprim=1)

part_idler22=Part(model, "idler22")
idler22_mar=Marker(part_idler22, "idler22_mar", ref=balance2_spmar)
Joint(model, "idler22J", idler22_mar, balance2_spmar)
idler22_marn2=Marker(part_idler22, "idler22_marn2", (0,0, -10-lm11.width/2-5), ref=balance2_spmar)
Extrusion(part_idler22, "sprocket1", sp_xy[1], -5, 1, ref=idler22_marn2)
Extrusion(part_idler22, "sprocket2", sp_xy[0], -4, 8, ref=idler22_marn2)
Extrusion(part_idler22, "sprocket3", sp_xy[1], 4, 1, ref=idler22_marn2)
idler22_marn3=Marker(part_idler22, "idler22_marn3", (0,0, -20-lm11.width/2-5), ref=balance2_spmar)
Extrusion(part_idler22, "sprocket4", sp_xy[1], -5, 1, ref=idler22_marn3)
Extrusion(part_idler22, "sprocket5", sp_xy[0], -4, 8, ref=idler22_marn3)
Extrusion(part_idler22, "sprocket6", sp_xy[1], 4, 1, ref=idler22_marn3)

Joint(model, "ParallelMotion3_3", idler22_mar, idler23_mar, "orientation", _jprim=1)

idler21_part=Part(model, "idler21")
idler21_mar=Marker(idler21_part, "idler21_mar", (_dxyz1[0]+_dxyz2[0],_dxyz1[1]+_dxyz2[1],0),ref=disk1_mar)
Joint(model, "idler21J", idler21_mar, balance3_spmar)
idler21_marn2=Marker(idler21_part, "idler21_marn2", (0,0,-10-lm11.width/2-5), ref=idler21_mar)
Extrusion(idler21_part, "Sproket1", sp_xy[1],-5, 1, ref=idler21_marn2)
Extrusion(idler21_part, "Sproket2", sp_xy[0],-4, 8, ref=idler21_marn2)
Extrusion(idler21_part, "Sproket3", sp_xy[1],4, 1, ref=idler21_marn2)
idler21_marn3=Marker(idler21_part, "idler21_marn3", (0,0,-20-lm11.width/2-5), ref=idler21_mar)
Extrusion(idler21_part, "Sproket4", sp_xy[1],-1, 1, ref=idler21_marn3)
Extrusion(idler21_part, "Sproket5", sp_xy[0],-4, 8, ref=idler21_marn3)
Extrusion(idler21_part, "Sproket6", sp_xy[1],4, 1, ref=idler21_marn3)

Joint(model, "ParallelMotion3_4", idler21_mar, idler22_mar, "orientation", _jprim=1)


balance4_spmar=Marker(balance4, "spmar", (_dxyz1[0]+_dxyz2[0]+_dxyz3[0],_dxyz1[1]+_dxyz2[1]+_dxyz3[1],0),ref=disk1_mar)
balance4_marn2=Marker(balance4, "balance4_marn2", (0,0,-10-lm11.width/2-5), ref=balance4_spmar)
Extrusion(balance4, "Sproket1", sp_xy[1],-5, 1, ref=balance4_marn2)
Extrusion(balance4, "Sproket2", sp_xy[0],-4, 8, ref=balance4_marn2)
Extrusion(balance4, "Sproket3", sp_xy[1],4, 1, ref=balance4_marn2)

Joint(model, "ParallelMotion3_5", balance4_spmar, idler21_mar, "orientation", _jprim=1)

Rn=R*gr
dln=dl*gr
drn=dr*gr
Ln=L*gr
lm13_alpha12=(a12(-drn, Rn)-a12(0, Rn))/d2r
lm13_shift1=55
lm13_shift2=110
lm13_FrameAngle=-lm13_shift1+lm13_alpha12	
lm13=SliderMechanismLean(model, "SLM13", dln, drn, Ln, Ln*0.4, Rn, disk3_mar, 0, lm13_shift1, lm13_shift2,   _motion=_motion[2], inner=distance_between_inner_braces*gr, quad=1)

Rn=R*gr
dln=dl*gr
drn=dr*gr
Ln=L*gr

lm14_alpha12=(a12(-drn, Rn)-a12(0, Rn))/d2r
lm14_shift1=55
lm14_shift2=110
lm14_FrameAngle=-lm14_shift1+lm14_alpha12	
lm14=SliderMechanismLean(model, "SLM14", dln, drn, Ln*0.6, Ln*0.3, Rn, lm13.disk2, 0, lm14_shift1, lm14_shift2,  _motion=_motion[3], inner=distance_between_inner_braces*gr, ball=0)
#
cmd="c:\\MSC.Software\\Adams\\2016\\common\\mdi.bat aview ru-s i e"
#simcmd="part modify rigid mass_properties  part_name = .Robot.secondPlate mass=60  center_of_mass_marker = .Robot.secondPlate.cm\n" 
simcmd=""
simcmd=simcmd+"simulation single trans type= static initial_static=no end_time=5 number_of_steps=50"
model.toFile("aview.cmd", simcmd)
os.system(cmd)
