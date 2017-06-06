from motionclass import *
from parautility import *
import numpy as np
import os

class SliderJoint(entity):
    def __init__(self, parent, Name, dl_, dr_, L_, R_, mar1):	
        entity.__init__(self, parent, Name, "_")
        self.dl=dl_
        self.dr=dr_
        self.L=L_
        self.R=R_
	self.mar1=mar1
	self.part2=None
	self.mar2=None

    def nextBase(self):
	return self.mar2    


class SliderMechanismLean(SliderJoint):
    def __init__(self, parent, Name, dl_, dr_, L_, R_,  mar1, alpha1=0, shift1=0, shift2=0, Disk=None):
	SliderJoint.__init__(self, parent, Name, dl_, dr_, L_, R_, mar1)
	r=0.1*R_
	T=0.1*R_
	braceH=0.8*R_
	alpha=np.degrees(np.arctan2(R_, L_+dl_-dr_))
	alpha12=(a12(-dr_, R_)-a12(0, R_))/self.d2r
        	
	self.FrameAngle=-shift1+alpha12	
	self.AlignedLineAngle_Gnd=alpha12-shift1-alpha
	if Disk is None:
            baseMarkerI=Marker(self.mar1.parent(), "baseMarkerI", pos=(0,0,0), orientation=(0,0,self.AlignedLineAngle_Gnd), ref=self.mar1)
	    self.Brace=Part(self, "Brace")
            basemar=Marker(self.Brace, "basemarker",  (0,0,0), (0,0,0), baseMarkerI)
	else:	
            baseMarkerI=Marker(Disk, "baseMarkerI", pos=(0,0,0), orientation=(0,0,self.AlignedLineAngle_Gnd), ref=self.mar1)
	    self.Brace=self.mar1.parent()
            basemar=Marker(self.Brace, "basemarker",  (0,0,0), (0,0,self.AlignedLineAngle_Gnd), self.mar1)
        revJoint1=Joint(self, "RevJ", basemar, baseMarkerI)
	zOri=0
	zBrace=T/2+braceH/2
	self.zOriSym=T+braceH
        self.mar1alignedwithmar2=Marker(self.Brace, "basemaralignedwithmar2",  (0,0,0), (0,0,alpha), basemar)  
	rot1=Variable(self, "rot1", "AZ(%s, %s)*RTOD"%(self.mar1alignedwithmar2.name(), self.mar1.name()))
  	self.mar2alignedwithmar1=   Marker(self.Brace, "mar2alignedwithmar1", pos=(L_+dl_-dr_, R_, -self.zOriSym), orientation=(0,0,alpha), ref=basemar)
	braceGeoMar=Marker(self.Brace, "braceGeoMar", (r+L_+dl_-dr_, r+braceH/2, -zBrace), (90, -90, -90), ref=basemar)
	pnts=[(T/2, -braceH/2), (braceH/2, -braceH/2), (braceH/2, braceH/2), (T/2, braceH/2), (T/2, braceH/2-T), (braceH/2-T, braceH/2-T), (braceH/2-T, -braceH/2+T), (T/2, -braceH/2+T)]
        Extrusion(self.Brace, "halfBraceL", pnts, 0, 2*r+L_+dl_-dr_, "RED", braceGeoMar)
	pnts=[(-i[0], i[1]) for i in pnts] 
	pnts.reverse()
        Extrusion(self.Brace, "halfBraceR", pnts, 0, 2*r+L_+dl_-dr_, "RED", braceGeoMar)
	
	self.part2=Part(self, "disk2")
  	self.mar2=Marker(self.part2,             "mar2", pos=(L_+dl_-dr_, R_, -self.zOriSym,), orientation=(0,0,0), ref=basemar)
  	brace2disk=Marker(self.Brace, "brace2disk", pos=(L_+dl_-dr_, R_, -self.zOriSym,), orientation=(0,0,0), ref=basemar)
        revJoint2=Joint(self, "RevJ2", self.mar2, brace2disk)
        baseMarkerII=Marker(self.part2, "baseMarkerII", pos=(0,0,0), orientation=(0,0,0), ref=self.mar2)
  	#Cylinder(self.part2, "disk", R_, T, Marker(self.part2, "Cyn_mar", (0,0,-T/2), ref=self.mar2))

	#slider
	slider=Part(self, "slider")
	sliderI=Marker(slider, "toBrace", (0, r+braceH/2, -zBrace), (90, 90, -90), ref=basemar)
	sliderJ=Marker(self.Brace, "toSlider", (0, r+braceH/2, -zBrace), (90, 90, -90), ref=basemar)
	sliderGeoMar=Marker(slider, "sliderGeoMar", (0, r+braceH/2, -zBrace),  ref=basemar)
	pnts=[(-r, braceH/2+r), (-r, -braceH/2-r), (L_+r, -braceH/2-r), (L_+r,braceH/2+r) ]
	pnts.reverse()
	Extrusion(slider, "sliderblock", pnts, -T/2, T, "RED", sliderGeoMar)

	slider2link1=Marker(slider, "slider2link1", (0, R_, 0), ref=basemar)		
	pnts=[(r*np.cos(i), r*np.sin(i)) for i in np.linspace(0, 180, 10)*self.d2r]
	Extrusion(slider, "sliderblock1", pnts, -T/2-braceH, braceH, "RED",  slider2link1)

	slider2link2=Marker(slider, "slider2link2", (L_, 0, -self.zOriSym), ref=basemar)		
	pnts=[(r*np.cos(i), r*np.sin(i)) for i in np.linspace(180, 360, 10)*self.d2r]
	Extrusion(slider, "sliderblock2", pnts, T/2, braceH, "RED",  slider2link2)

        transJ=Joint(self, "SliderJoint", sliderI, sliderJ, "translational")
	motionFunc=Variable(self, "motionFunc",  "%f+sin(time/5*(PI/2))*%f"%(-dr_, dl_+dr_))
        motion=Motion123(self, "sliderMotion", sliderI, sliderJ, 'z', "VARVAL(%s)"%motionFunc.name()) 
        #motion=Motion123(self, "sliderMotion", sliderI, sliderJ, 'z', "0") 

        link1=Part(self, "Link1")
        link12slider=Marker(link1, "toSlider",   ref=slider2link1) 
        pos=(-R_*0.866, R_*0.5, 0)
        link12disk1=Marker(link1, "todisk1",  pos,  ref=basemar) 
	if Disk is None:
	    disk12link1=Marker(self.mar1.parent(), "tolink1", pos, ref=baseMarkerI)
        else:    
	    disk12link1=Marker(Disk, "tolink1", pos, ref=baseMarkerI)
        Link(link1, "link", T, T, link12slider, link12disk1)

	JntSliderLnk1=Joint(self, "Jslider_link1", slider2link1, link12slider)
	JntDisk1Lnk1=Joint(self, "Jdisk1_link1", link12disk1,  disk12link1)
	
        link2=Part(self, "Link2")
        link22slider=Marker(link2, "toSlider",   ref=slider2link2) 
        ang=-a34(-dl_+dr_, R_)
        angic=-a34(-dl_+dr_*0, R_)
	alpha34= ang/self.d2r-angic/self.d2r
        pos=(R_*np.cos(ang), R_*np.sin(ang), 0)
	link22disk2=Marker(link2, "todisk", pos, ref=self.mar2)
	disk22link2=Marker(self.mar2.parent(), "tolink2", pos, ref=baseMarkerII)
	JntDisk2Lnk2=Joint(self, "Jdisk2_link2", link22disk2,  disk22link2)
	
        Link(link2, "link", T, T, link22slider, link22disk2)

	JntSliderLnk2=Joint(self, "Jslider_link2", slider2link2, link22slider)
	#restore the aligned line to the zero0 and start from there
	self.Disk2AngleFromAligned=(shift1-alpha1)+(alpha34-shift2)
	self.shiftedmarBack=Marker(self.part2, "shiftedmarBack", (0,0,0), (0, 0, self.Disk2AngleFromAligned), ref=self.mar2alignedwithmar1) 
	self.distalmarBack=Marker(self.part2, "distalmarBack", (L_, 0, 0), (0,0,0), ref=self.shiftedmarBack)
	rot2=Variable(self, "rot2", "AZ(%s, %s)*RTOD"%(self.shiftedmarBack.name(), self.mar1.name()))
	Link(self.part2, "link1", T, T, self.shiftedmarBack, self.distalmarBack) 
	linkXdisk=Marker(self.part2, "linkXdisk", (R_, 0, 0), (0,0,0), ref=self.shiftedmarBack)
	Plate(self.part2, "triangle", T, T, (self.mar2, disk22link2, linkXdisk)) 
	self.shiftedmarFront=Marker(self.part2, "shiftedmarFront", (0, 0, 1.1*braceH), ref=self.shiftedmarBack)
	self.distalmarFront=Marker(self.part2, "distalmarFront", (0, 0, 1.1*braceH), ref=self.distalmarBack)
	#print 1.1*braceH
	Link(self.part2, "link2", T, T, self.shiftedmarFront, self.distalmarFront) 
	Variable(self, "disk2_rot", "AZ(%s, %s)*RTOD"%(self.shiftedmarFront.name(), self.mar2alignedwithmar1.name())) 
	if Disk is not None:
	    mar1_disk1=Marker(Disk, "mar1_disk1", ref=self.mar1)
	    Variable(self, "disk1_rot", "AZ(%s, %s)*RTOD"%(mar1_disk1.name(), self.mar1alignedwithmar2.name())) 
        else:    
	    Variable(self, "disk1_rot", "AZ(%s, %s)*RTOD"%(self.mar1.name(), self.mar1alignedwithmar2.name())) 





if __name__ == "__main__":	
  scale=0.1
  dl=1.3448*scale
  dr=0.9*scale
  L=5*scale
  R=1*scale
  alpha1=45*0
  model=Model("sliderActuator", mm="meter", mass="kg", force="newton", icon_size=0.021)
  ground=model.ground()

  mar1=Marker(ground, "ground_marker", (0,0,0), (0, 0, alpha1))
  p1_disk=Cylinder(ground, "cyn1",  R, 0.1*R, Marker(ground, "toDisk", (0,0,-0.05*R), ref=mar1)) 
  slider=SliderMechanismLean(model, "SLM", dl, dr, L, R, mar1, alpha1,shift1=55, shift2=110)


  lines=model.commands([])
  pf=file("aview.cmd", "w")
  for l in lines:
      pf.write("%s\n"%l)
  pf.write("simulation single trans type= static initial_static=no end_time=5 number_of_steps=50\n")
  pf.close()    
  cmd="c:\\MSC.Software\\Adams\\2016\\common\\mdi.bat aview ru-s i e"
  os.system(cmd)
