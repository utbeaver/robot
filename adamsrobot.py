from motionclass import *
from leanslider import *
import numpy as np
import os
zero3=(0,0,0)
d2r=np.pi/180

alpha1=45
alpha2=45
alpha3=45
alpha4=45
scale=1.0
gr=0.618

basesize=150*scale
conR=basesize/10
halfsize=basesize/2
effDist=basesize-2*conR

R=basesize-2*conR
dl=1.3448*R
dr=0.9*R
ll=np.sqrt(400*400.0-R*R)
L=ll-(dl-dr)
model=Model("Robot", mm="mm", mass="kg", force="newton", icon_size=10)
ground=model.ground()
BaseMarker=Marker(ground, "RobotBase", pos=zero3, orientation=(0,-90,0))
tempL=(effDist)*gr+conR
boxBotMar=Marker(ground, "boxBot", pos=(0,0, -halfsize*(0.5+0.1)-tempL), orientation=zero3, ref=BaseMarker)
Box(ground, "basebox", basesize,basesize,halfsize/2, Marker(ground, "baseboxMar", pos=(-halfsize,-halfsize,-halfsize*(0.5+0.1)*0-tempL*0), orientation=zero3, ref=boxBotMar))
#rotBase
rotBase=Part(model, "rot_base")
rotBaseMarkerI=Marker(rotBase, "baseI", pos=(0,0,halfsize*0.5), orientation=zero3, ref=boxBotMar)
rotBaseMarkerJ=Marker(ground,  "groundJ", pos=(0,0,halfsize*0.5), orientation=zero3, ref=boxBotMar)
ActiveJoint1=Joint(model, "firstJ", rotBaseMarkerI, rotBaseMarkerJ)
motion=Motion123(model, "baseMotion", rotBaseMarkerI, rotBaseMarkerJ, 'b3', "0") 
rotdisk=Cylinder(rotBase, "disk", halfsize*np.sqrt(2), basesize*0.05, rotBaseMarkerI) 
#4 half connectors
z2you=Marker(rotBase, "z2you", pos=zero3, orientation=(0,90,0), ref=BaseMarker)
beta1=(180-alpha1)/2.0
pns=[(conR, -tempL)]+[(conR*cos(i), conR*sin(i)) for i in np.radians(np.linspace(0, 180, 10))]+[(-conR, -tempL)]
temp=halfsize-conR
_3pts=[(temp, 0), (temp-2*temp*cos(-alpha1*d2r), -2*temp*sin(-alpha1*d2r)), (-temp,0)]
pns=[(-temp-conR, -tempL), (-temp+conR, -tempL), (-temp+conR, 0), (temp-conR,0), (temp-conR, -tempL), (temp+conR, -tempL)]
pns=pns+[(_3pts[0][0]+conR*np.cos(i), _3pts[0][1]+conR*np.sin(i)) for i in np.radians(np.linspace(0, alpha1,5))]
pns=pns+[(_3pts[1][0]+conR*np.cos(i), _3pts[1][1]+conR*np.sin(i)) for i in np.radians(np.linspace(alpha1, beta1+90,10))]
pns=pns+[(_3pts[2][0]+conR*np.cos(i), _3pts[2][1]+conR*np.sin(i)) for i in np.radians(np.linspace(beta1+90, 180,5))]
T=basesize/20
TT=2*T
braceMarkerF=Marker(rotBase, "braceF", (0, 0, halfsize-2*T*1.5), (0,0,0), ref=z2you)
Extrusion(rotBase, "braceFront", pns, -2*T/2, 2*T, "RED", braceMarkerF)
braceFR=Marker(rotBase, "braceFR", (_3pts[0][0], _3pts[0][1], 0), (0, 0, -alpha1+90), ref=braceMarkerF) 
braceFU=Marker(rotBase, "braceFU", (_3pts[1][0], _3pts[1][1], 0), (0, 0, -alpha1+90), ref=braceMarkerF) 
braceFL=Marker(rotBase, "braceFL", (_3pts[2][0], _3pts[2][1], 0), (0, 0, 0), ref=braceMarkerF) 

braceMarkerB=Marker(rotBase, "braceB", (0, 0, -halfsize+2*T*1.5), (0,0,0), ref=z2you)
Extrusion(rotBase, "braceback", pns, -2*T/2, 2*T, "RED", braceMarkerB)
braceBR=Marker(rotBase, "braceBR", (_3pts[0][0], _3pts[0][1], 0), (0, 0, -alpha1), ref=braceMarkerB) 
Cylinder(rotBase, "cynBR", conR/2, basesize-2*T*3, ref=braceBR) 
braceBU=Marker(rotBase, "braceBU", (_3pts[1][0], _3pts[1][1], 0), (0, 0, -alpha1), ref=braceMarkerB) 
braceBL=Marker(rotBase, "braceBL", (_3pts[2][0], _3pts[2][1], 0), (0, 0, 0), ref=braceMarkerB) 

disk1_mar=Marker(rotBase, "disk_cne_mar", (basesize/2-conR, 0, 0.45*R), (0, 0, 90-alpha1), ref=z2you)
#disk1=Cylinder(rotBase, "disk1", R, 0.1*R, Marker(rotBase, "disk_mar", (0, 0, -0.05*R), ref=disk1_mar))
lm11=SliderMechanismLean(model, "SLM11", dl, dr, L, R, disk1_mar, 90-alpha1, 45, 89.9)
angleAlignedLine=lm11.FrameAngle
angleFromAbligned=lm11.Disk2AngleFromAligned
angleAlignedFromLevel=90-alpha1+angleAlignedLine
ll=np.sqrt(R*R+(L+dl-dr)*(L+dl-dr))
brace2ParaLnk=Marker(rotBase, "brace2Paralnk1",  (0, 0, -2*T/2-T/2), ref=braceFU)
ParaLnk11=Part(model, "ParaLnk11")
ParaLnk11MarI=Marker(ParaLnk11, "ParaLnk11I", ref=brace2ParaLnk)
JParaLnk11_rotbase=Joint(model, "JParaLnk11_rotbase", brace2ParaLnk, ParaLnk11MarI)
ParaMar2=Marker(ParaLnk11, "paraMar2", (ll*np.cos(angleAlignedLine*d2r), ll*np.sin(angleAlignedLine*d2r)+(effDist), -2*T/2-T/2), ref=braceFR)
Link(ParaLnk11, "link", T, T, ParaLnk11MarI, ParaMar2)


ParaLnk12=Part(model, "ParaLnk12")
ang=(180-alpha1+90)*d2r
pos=((effDist)/2+(effDist)*np.cos(ang), (effDist)*np.sin(ang), -halfsize+2*T*1.3-2*T/2-T/2)
braceToLnk2Mar=Marker(rotBase, "braceToLnk2Mar", pos, (0, 0, angleAlignedFromLevel)) 
Lnk2ToBrace=Marker(ParaLnk12, "Lkn2ToBrace", pos, (0, 0, angleAlignedFromLevel)) 
Lnk2ToPlate90=Marker(ParaLnk12, "Lnk2ToPlate90", (ll, 0, 0), (0,0,0), ref=Lnk2ToBrace)
Link(ParaLnk12, "link", T, T, Lnk2ToBrace, Lnk2ToPlate90)
Joint(model, "paralnk2_brace", Lnk2ToBrace, braceToLnk2Mar)



firstPlate=Part(model, "firstPlate")
lm11toPlate=Marker(lm11.Brace, "lm11toPlate", (ll*np.cos(angleAlignedLine*d2r), ll*np.sin(angleAlignedLine*d2r), -2*T/2-T/2), ref=braceFR)
firstPmar1=Marker(firstPlate, "firstPmar1", (ll*np.cos(angleAlignedLine*d2r), ll*np.sin(angleAlignedLine*d2r), -2*T/2-T/2), ref=braceFR)
J1stPlate_lm11brace=Joint(model, "J1stPlate_lm11brace", firstPmar1, lm11toPlate)
firstPmar1Vertical=Marker(firstPlate, "firstPmar1Vertical", orientation=(0,0, -alpha2), ref=firstPmar1)
firstPmar2=Marker(firstPlate, "firstPmar2", (0, effDist, 0), ref=firstPmar1Vertical)
firstPmar3=Marker(firstPlate, "firstPmar3",  ref=ParaMar2)
Plate(firstPlate, "plate", 2*T, T, (firstPmar1, firstPmar2, firstPmar3))
J1stPlate_Paralnk1=Joint(model, "J1stPlate_Paralnk1", firstPmar3, ParaMar2)



ParaMar3J=Marker(firstPlate, "toLink3J", (0, 0, -T/2+T/4), ref=firstPmar2)
ParaLnk13=Part(model, "ParaLnk13")
ParaLnk13MarI=Marker(ParaLnk13, "toLink3I", (0, effDist, -T/2+T/4), (0,0,angleAlignedFromLevel+angleFromAbligned), ref=firstPmar1Vertical)
Joint(model, "ParaLnk12_1stPlat", ParaLnk13MarI, ParaMar3J)
ParaLnk13MarJ=Marker(ParaLnk13, "toLink3J", (L, 0, 0), ref=ParaLnk13MarI)
Link(ParaLnk13, "link3", T, T, ParaLnk13MarI, ParaLnk13MarJ)

secondPlate=Part(model, "secondPlate")
sndPmar1=Marker(secondPlate, "sndPmar1", (0,0,0), ( 0,0,-angleAlignedFromLevel-angleFromAbligned), ref=ParaLnk13MarJ)
sndPmar3=Marker(secondPlate, "sndPmar3", (0,-(effDist),0),  ref=sndPmar1)
sndPmar2=Marker(secondPlate, "sndPmar2", ((effDist)*np.cos(alpha3*d2r),-(effDist)*np.cos(alpha3*d2r), 0),  ref=sndPmar1)
Cylinder(secondPlate, "Cyn", 0.1*R, T+R, Marker(secondPlate, "cynMar", (0,0,-(T+R)), ref=sndPmar2))
Plate(secondPlate, "plate", T, T, (sndPmar1, sndPmar2, sndPmar3))
Joint(model, "paraLink3_2ndPlate", sndPmar1, ParaLnk13MarJ)
sndPmar3_dup=Marker(secondPlate, "sndPmar3_dup", ref=lm11.distalmarFront)
Joint(model, "paraLink2_2ndPlate", sndPmar3_dup, lm11.distalmarFront)

firstPlate90=Part(model, "firstPlate90")
firstPmar1_90=Marker(firstPlate90, "firstPmar1Vertical90", (0, 0, -(basesize-3*2*T+T/10*4)+T+T/2),  orientation=(0,0, -alpha2+90), ref=firstPmar1)
lm11toPlate90=Marker(lm11.Brace, "lm11toPlate90", (0, 0, -(basesize-3*2*T+T/10*4)+T+T/2), ref=lm11toPlate)
J1stPlate90_lm11brace=Joint(model, "J1stPlate90_lm11brace", firstPmar1_90, lm11toPlate90)
firstPmar2_90=Marker(firstPlate90, "firstPmar2_90", (0, effDist, 0), (0, 0,angleAlignedFromLevel+angleFromAbligned), ref=firstPmar1_90)
firstPmar3_90=Marker(firstPlate90, "firstPmar3_90", (-(effDist)*np.cos(alpha2*d2r), (effDist)*np.sin(alpha2*d2r), 0), ref=firstPmar1_90)
Plate(firstPlate90, "plate90", 2*T, T, (firstPmar1_90, firstPmar2_90, firstPmar3_90))
Lnk2ToPlate90_=Marker(ParaLnk12, "Lnk2ToPlate90_", (ll, 0, T+T/2), (0,0,0), ref=Lnk2ToBrace)
Joint(model, "paraLink2_Plate90", Lnk2ToPlate90_, firstPmar3_90)

ParaLnk14=Part(model, "ParaLnk14")
ParaLnk14I=Marker(ParaLnk14, "ParaLnk14I", (0,0,T), ref=firstPmar2_90)
Para_plate90=Marker(firstPlate90, "Para_plate90", (0,0,T), ref=firstPmar2_90)
Joint(model, "paraLink4_Plate90", ParaLnk14I, Para_plate90)
ParaLnk14J=Marker(ParaLnk14, "ParaLnk14J", (0, -L,T),ref=firstPmar2_90)
Link(ParaLnk14, "link", T, T, ParaLnk14I, ParaLnk14J)

secPlate90=Part(model, "secPlate90")
secPmar1_90=Marker(secPlate90, "secPmar1_90", (0, 0, -lm11.zOriSym-T-T), (0,0,90), ref=sndPmar3)
secPmar2_90=Marker(secPlate90, "secPmar2_90", (effDist,0,0),  ref=secPmar1_90)
secPmar1d_90=Marker(secPlate90, "secPmar1d_90", (-(effDist)*np.sin(alpha3*d2r),-(effDist)*np.cos(alpha3*d2r),0), (0,0,-alpha3),  ref=secPmar2_90)
secPmar2d_90=Marker(secPlate90, "secPmar2d_90", (-(effDist),0,0),  ref=secPmar1d_90)
secPmar3_90=Marker(secPlate90, "secPmar3_90", (0,effDist,0),  ref=secPmar1_90)
#Plate(secPlate90, "plate", T, T, (secPmar1_90, secPmar1d_90, secPmar2_90, secPmar3_90))
Plate(secPlate90, "plate", T, T, (secPmar3_90, secPmar2d_90, secPmar1d_90))#, secPmar3_90))


secPmar3_90_pair=Marker(secPlate90, "secPmar3_90_pair",  ref=ParaLnk14J)
secPmar1_90_pair=Marker(secPlate90, "secPmar1_90_pair",  ref=lm11.distalmarBack)
Joint(model, "lnk4_plate2_90", ParaLnk14J, secPmar3_90_pair)
Joint(model, "part2_plate2_90", lm11.distalmarBack, secPmar1_90_pair)

#for another slider joint
sndPmar2For2ndSlider=Marker(secondPlate, "sndPmar2For2ndSlider", (0,0,0),(0,0,alpha3),  ref=sndPmar2)
sndPmar1For2ndSlider=Marker(secondPlate, "sndPmar1For2ndSlider", (0,0,0),(0,0,alpha3),  ref=sndPmar1)
disk2_mar=Marker(secondPlate, "disk2_cen_mar", (0,0,-(T+halfsize*0)),  ref=sndPmar2For2ndSlider)
#Cylinder(secondPlate, "disk2", R, 0.1*R, Marker(secondPlate, "disk_mar", (0, 0, -0.05*R), ref=disk2_mar))

lm12=SliderMechanismLean(model, "SLM12", dl, dr, L, R, disk2_mar, 90-alpha3, 45, 89.9)

angleAlignedLine2=lm12.FrameAngle
angleFromAbligned2=lm12.Disk2AngleFromAligned
angleAlignedFromLevel2=90-alpha1+angleAlignedLine
ll1=np.sqrt(R*R+(L+dl-dr)*(L+dl-dr))
ParaLnk21=Part(model, "ParaLnk21")
ParaLnk21Mar1=Marker(ParaLnk21, "ParaLnk21Mar1", ref=sndPmar1For2ndSlider) 
Joint(model, "Plate1_ParaLnk21", ParaLnk21Mar1, sndPmar1For2ndSlider)
ParaLnk21Mar2=Marker(ParaLnk21, "ParaLnk21Mar2", (ll1*np.cos(angleAlignedLine2*d2r), ll1*np.sin(angleAlignedLine2*d2r), 0), ref=ParaLnk21Mar1)
Link(ParaLnk21, "link", T, T, ParaLnk21Mar1, ParaLnk21Mar2)

TrdPlate=Part(model, "TrdPlate")
TrdPmar1=Marker(TrdPlate, "TrdPmar1", (0,0,0), (0, 0,  -angleAlignedFromLevel2-angleFromAbligned2), ref=lm12.shiftedmarFront)
TrdPmar2=Marker(TrdPlate, "TrdPmar2", (0, effDist, 0), ref=TrdPmar1)
TrdPmar3=Marker(TrdPlate, "TrdPmar3", (-(effDist)*np.cos(alpha4*d2r), (effDist)*np.sin(alpha4*d2r),  0), ref=TrdPmar1)
Plate(TrdPlate, "plate", T, T, (TrdPmar1, TrdPmar2, TrdPmar3))
Joint(model, "Plate3_ParaLnk21", ParaLnk21Mar2, Marker(TrdPlate, "toLink21", ref=ParaLnk21Mar2))
Joint(model, "plate3_toDisk2", TrdPmar1, lm12.shiftedmarFront)

TrdPlate90=Part(model, "TrdPlate90")
TrdPmar1d_90=Marker(TrdPlate90, "TrdPmar1d_90", (0,0,0), (0, 0,  -angleAlignedFromLevel2-angleFromAbligned2+90), ref=lm12.shiftedmarBack)
Joint(model, "TrdPlatetoAxis", TrdPmar1d_90, lm12.shiftedmarBack)
TrdPmar1_90=Marker(TrdPlate90, "TrdPmar1_90", (0,0,-T), (0, 0,  -angleAlignedFromLevel2-angleFromAbligned2+90), ref=lm12.shiftedmarBack)
TrdPmar2_90=Marker(TrdPlate90, "TrdPmar2_90", (0, effDist, 0), ref=TrdPmar1_90)
TrdPmar3_90=Marker(TrdPlate90, "TrdPmar3_90", (-(effDist)*np.cos(alpha4*d2r), (effDist)*np.sin(alpha4*d2r),  0), ref=TrdPmar1_90)
Plate(TrdPlate90, "plate90", T, T, (TrdPmar1_90, TrdPmar2_90, TrdPmar3_90))


ParaLnk22=Part(model, "ParaLnk22")
ParaLnk22Mar1=Marker(ParaLnk22, "ParaLnk22Mar1", (0,0,-T), ref=secPmar2d_90)
ParaLnk22Mar2=Marker(ParaLnk22, "ParaLnk22Mar2", (0,0,-T), ref=TrdPmar3_90)
Link(ParaLnk22, "link", T, T, ParaLnk22Mar1, ParaLnk22Mar2)
Joint(model, "Paralnk22_secPlate", ParaLnk22Mar1, Marker(secPlate90, "secplate_toParaLnk22", (0,0,-T), ref=secPmar2d_90))
Joint(model, "Paralnk22_TrdPlate", ParaLnk22Mar2, Marker(TrdPlate90, "Trdplate_toParaLnk22", (0,0,-T), ref=TrdPmar3_90))

ParaLnk23=Part(model, "ParaLnk23")
ParaLnk23Mar1=Marker(ParaLnk23, "ParaLnk23Mar1", (0,0,0), ref=TrdPmar2)
Joint(model, "ParaLnk23_TrdPlate", ParaLnk23Mar1, TrdPmar2)
ParaLnk23Mar2=Marker(ParaLnk23, "ParaLnk23Mar2", (L*np.cos(d2r*(angleAlignedFromLevel2+angleFromAbligned2)),L*np.sin(d2r*(angleAlignedFromLevel2+angleFromAbligned2)),0), ref=TrdPmar2)
Link(ParaLnk23, "link", T, T, ParaLnk23Mar1, ParaLnk23Mar2)

ParaLnk24=Part(model, "ParaLnk24")
ParaLnk24Mar1=Marker(ParaLnk24, "ParaLnk24Mar1", (0,0,0), (0,0,-90), ref=TrdPmar2_90)
Joint(model, "ParaLnk24_TrdPlate90", ParaLnk24Mar1, TrdPmar2_90)
ParaLnk24Mar2=Marker(ParaLnk24, "ParaLnk24Mar2", (L*np.cos(d2r*(angleAlignedFromLevel2+angleFromAbligned2)),L*np.sin(d2r*(angleAlignedFromLevel2+angleFromAbligned2)),0), ref=ParaLnk24Mar1)
Link(ParaLnk24, "link", T, T, ParaLnk24Mar1, ParaLnk24Mar2)

FthPlate=Part(model, "FthPlate")
FthPmar1=Marker(FthPlate, "FthPmar1", ref=ParaLnk23Mar2)
Joint(model, "Fthplate_ParaLnk23", FthPmar1, ParaLnk23Mar2)
#Bushing(model, "Fthplate_PataLnk23", FthPmar1, ParaLnk23Mar2, (1.0e10, 1.0e10, 0), (1000.0, 1000.0, 0.0), (0, 0, 0), (0, 0, 0) )
FthPmar2=Marker(FthPlate, "FthPmar2", (0, -(effDist), 0), ref=FthPmar1)
Joint(model, "Fthplate_lm12_DISK2", FthPmar2, lm12.distalmarFront)
FthPmar3=Marker(FthPlate, "FthPmar3", (effDist/2,0, 0), ref=FthPmar2)
FthPmar4=Marker(FthPlate, "FthPmar4", (effDist/2,0, 0), ref=FthPmar1)
Plate(FthPlate, "plate", T, T, (FthPmar1, FthPmar2, FthPmar3, FthPmar4)) 
#
#FthPlate90=Part(model, "FthPlate90")
FthPlate90=FthPlate
FthPmar0_90=Marker(FthPlate90, "FthPmar0_90", ref=ParaLnk24Mar2)
Joint(model, "Fthplate90_PataLnk24", FthPmar0_90, ParaLnk24Mar2)
#Bushing(model, "Fthplate90_PataLnk24", FthPmar0_90, ParaLnk24Mar2, (1.0e5, 1.0e5, 0), (.0, .0, 0.0), (0, 0, 0), (0, 0, 0) )
FthPmar1_90=Marker(FthPlate90, "FthPmar1_90", (effDist, 0, 0),  ref=FthPmar0_90)
FthPmar1d_90=Marker(FthPlate90, "FthPmar1d_90", ref=lm12.distalmarBack)
Joint(model, "Fthplate90_lm12_disk2", FthPmar1d_90, lm12.distalmarBack)
FthPmar2_90=Marker(FthPlate90, "FthPmar2_90", (effDist/2, 0, 0),  ref=FthPmar1_90)
FthPmar3_90=Marker(FthPlate90, "FthPmar3_90", (0, effDist, 0),  ref=FthPmar2_90)
Plate(FthPlate90, "plate90", T, T, (FthPmar0_90, FthPmar1_90, FthPmar2_90, FthPmar3_90)) 

cen_mar=Marker(FthPlate90, "center_mar", (effDist+T/2, effDist/2, -R/2), (0,-90,0), ref=FthPmar3)
cyn_mar=Marker(FthPlate90, "Cylinder_mar", (effDist+T/2, effDist/2*0, -R/2), (0,-90,0), ref=FthPmar3)
Cylinder(FthPlate90, "cyn", T, effDist, cyn_mar)
#box_corner=Marker(FthPlate90, "plateCorner", (0,0,0), (90,90,-90),ref=FthPmar3)
#Box(FthPlate90, "FacePlate", R, effDist, T, box_corner)
UpPlate_mar1=Marker(FthPlate90, "UpPlate_mar1", (0,0,0), (0, -90, 0), ref=FthPmar4)
UpPlate_mar2=Marker(FthPlate90, "UpPlate_mar2", (0,0,effDist), (0, 0, 0), ref=cyn_mar)
UpPlate_mar3=Marker(FthPlate90, "UpPlate_mar3", (0,0,0), (0, -90, 0), ref=FthPmar3_90)
Plate(FthPlate90, "plateUp", T, T, (UpPlate_mar1, UpPlate_mar2, UpPlate_mar3)) 
DnPlate_mar1=Marker(FthPlate90, "DnPlate_mar1", (0,0,0), (0, -90, 0), ref=FthPmar3)
DnPlate_mar2=Marker(FthPlate90, "DnPlate_mar2", (0,0,effDist), (0, 0, 0), ref=cyn_mar)
DnPlate_mar3=Marker(FthPlate90, "DnPlate_mar3", (0,0,0), (0, -90, 0), ref=FthPmar2_90)
Plate(FthPlate90, "plateDn", T, T, (DnPlate_mar1, DnPlate_mar2, DnPlate_mar3)) 

Rn=R*0.8
dln=dl*0.8
drn=dr*0.8
Ln=L/2
#RotDiskJ4=Part(model, "RotDiskJ4")
#Mar2DiskJ4I=Marker(RotDiskJ4, "Mar2DiskJ4I", (0,0,basesize/8), ref=cen_mar)
#FthPlate2DiskI=Marker(FthPlate, "FthPlate2DiskI", (0,0,basesize/8), ref=cen_mar)
#Cylinder(FthPlate90, "cyn", Rn, T/2, Mar2DiskJ4I)
#alpha=np.arctan2(Rn, Ln+dln-drn)/d2r
lm13_alpha12=(a12(-drn, Rn)-a12(0, Rn))/d2r
lm13_shift1=55
lm13_shift2=110
lm13_FrameAngle=-lm13_shift1+lm13_alpha12	
#mar1_13=Marker(FthPlate, "mar1_13", (0,0,0), (0,0, -lm13_FrameAngle), ref=FthPlate2DiskI)
#mar1_disk=Marker(RotDiskJ4, "mar1_disk", ref=mar1_13)
lm13_basemar=Marker(FthPlate90, "lm13_basemar", (0, 0, effDist/4*3), ref=cyn_mar)
lm13=SliderMechanismLean(model, "SLM13", dln, drn, Ln, Rn, lm13_basemar, 0, lm13_shift1, lm13_shift2, 0.3)

cmd="c:\\MSC.Software\\Adams\\2016\\common\\mdi.bat aview ru-s i e"
simcmd="simulation single trans type= static initial_static=no end_time=5 number_of_steps=50"
model.toFile("aview.cmd", simcmd)
#model.toFile("aview.cmd")
os.system(cmd)
