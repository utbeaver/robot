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


class SliderMechanism(SliderJoint):
    def __init__(self, parent, Name, dl_, dr_, L_, R_,  mar1):
	SliderJoint.__init__(self, parent, Name, dl_, dr_, L_, R_, mar1)
        lR=1.25*self.R
        sR=0.75*self.R
	T=0.1*self.R
	alpha=np.degrees(np.arctan2(2*R_, L+dl_-dr_))
        baseMarkerI=Marker(self.mar1.parent(), "baseMarkerI", pos=(0,0,-2*T), orientation=(0,0,-alpha), ref=self.mar1)
	self.part2=Part(self, "disk2")
  	self.mar2=Marker(self.part2, "mar2", pos=(L+dl-dr, 2*R, 2*T), orientation=(0,0,0), ref=baseMarkerI)
        baseMarkerII=Marker(self.part2, "baseMarkerII", pos=(0,0,-2*T), orientation=(0,0,0), ref=self.mar2)
  	Cylinder(self.part2, "disk", R, 0.1*R, Marker(self.part2, "Cyn_mar", (0,0,-0.05*R), ref=self.mar2))

        self.pnts=[(-lR, lR)]
        for ang in np.linspace(180, 360, 10)*self.d2r:
            self.pnts.append((lR*np.cos(ang), lR*np.sin(ang)))
        self.pnts.append((lR, sR))
        self.pnts.append((self.L+self.dl-self.dr+lR, sR))
        for ang in np.linspace(0, 180, 10)*self.d2r:
            self.pnts.append((self.L+self.dl-self.dr+lR*np.cos(ang), 2*self.R+lR*np.sin(ang)))
        self.pnts.append((self.L+self.dl-self.dr-lR, lR))

        self.base=Part(self, "baseplate")
        basemar=Marker(self.base, "basemarker",  (0,0,0), (0,0,0), baseMarkerI)  #for geo construction
        revJoint1=Joint(self, "RevJ", basemar, baseMarkerI)
	meas_angle1=Measure(self, "Angle1", "AZ(%s, %s)*180/PI"%(basemar.name(), baseMarkerI.name())) 
        self.slider=Part(self, "slider", pos=(-self.R*0, self.R, 0), ref=basemar)
        self.geoPlate=Extrusion(self.base, "plateExtrusion", self.pnts, 0.0, self.R/10.0, "RED", basemar)

        corner=Marker(self.slider, "corner",   pos=(-self.R/10.0, self.R-self.R/10.0 , self.R/10.0), ref=basemar)
        cornerbase=Marker(self.base, "corner", pos=(-self.R/10.0, self.R-self.R/10.0 , self.R/10.0), ref=basemar)
        self.block=Box(self.slider, "sliderbox", self.R/5.0+self.L, self.R/5.0, self.R/10.0, corner)

        mar_block2link1=Marker(self.slider, "toLink1", pos=(self.R/10.0, self.R/10.0, self.R/20.0*3), orientation=(0, 0, 0), ref=corner) 
        mar_block2link2=Marker(self.slider, "toLink2", pos=(self.R/10.0+self.L, self.R/10.0, self.R/20.0*3), orientation=(0, 0, 0), ref=corner) 
        marItra=Marker(self.slider, "translateI", pos=(self.L/2.0, self.R/10.0,self.R/20.0), orientation=(90,90,0), ref=corner)
        marJtra=Marker(self.base, "translateJ", pos=(self.L/2.0, self.R/10.0,self.R/20.0), orientation=(90,90,0), ref=cornerbase)
        transJ=Joint(self, "SliderJoint", marItra, marJtra, "translational")
	meas_disp=Measure(self, "slider_disp",  "DZ(%s, %s, %s)"%(marItra.name(), marJtra.name(), marJtra.name())) 
	reActActForcex=CompMeasure(self, "ReActForcex", transJ, "element_force", "x", marJtra)
	reActActForcey=CompMeasure(self, "ReActForcey", transJ, "element_force", "y", marJtra)
        
        pos=(-self.R*0.866, self.R*0.5, self.R/20.0*5)
        link1=Part(self, "Link1")
        link1_2_slider=Marker(link1, "toSlider",  pos=(0, self.R, self.R/20.0*5), orientation=(0, 0, 0), ref=basemar) 
        link1_2_disk1=Marker(link1, "toDisk1",  pos=pos, orientation=(0, 0, 0), ref=basemar) 
        link1geo=Link(link1, "link", self.R/10.0, self.R/10.0, link1_2_slider, link1_2_disk1)
        #link1.geometry(link1geo)

        revJoint2=Joint(self, "link1_slider", mar_block2link1, link1_2_slider)

        disk12link1=Marker(self.mar1.parent(), "tolink1",  pos=pos, orientation=(0, 0, 0), ref=baseMarkerI) 
        revJoint3=Joint(self, "link1_disk1", link1_2_disk1, disk12link1)

        ang=-a34(-self.dl+self.dr, self.R)#/self.d2r
        pos=(self.R*np.cos(ang), self.R*np.sin(ang), self.R/20.0*5)
        disk22link2=Marker(self.mar2.parent(), "tolink2",  pos=pos, orientation=(0, 0, 0), ref=baseMarkerII) 

        link2=Part(self, "Link2")
        link2_2_disk2=Marker(link2, "toDisk2", (0,0,0), (0,0,0),ref=disk22link2)
        link2_2_slider=Marker(link2, "toSlider",(0,0,0), (0,0,0), ref=mar_block2link2)
        link2geo=Link(link2, "link2", self.R/10.0, self.R/10.0, link2_2_slider, link2_2_disk2)
        #link2.geometry(link2geo)

        revJoint4=Joint(self, "link2_slider", mar_block2link2, link2_2_slider)
        revJoint5=Joint(self, "link2_disk2", link2_2_disk2, disk22link2)
        base2disk2=Marker(self.base, "base2disk2", (0,0,0), (0,0,0), ref=self.mar2)
        revJoint6=Joint(self, "base_disk2", self.mar2, base2disk2)
	meas_angle2=Measure(self, "Angle2", "AZ(%s, %s)*180/PI"%(self.mar2.name(), base2disk2.name())) 
        #motion=Motion123(self, "sliderMotion", marItra, marJtra, 'z', "0.5*%f*sin(3.14159/60*time)+0.5*%f"%(self.dl+self.dr, self.dl-self.dr)) 
        motion=Motion123(self, "sliderMotion", marItra, marJtra, 'z', "%f+time/120*%f"%(-self.dr, self.dl+self.dr)) 
	ActForce=CompMeasure(self, "MotionForce", motion, "element_force", "z", marJtra)

        	  
class SliderMechanismLean(SliderJoint):
    def __init__(self, parent, Name, dl_, dr_, L_, R_,  mar1, shift=0, sign=1):
	SliderJoint.__init__(self, parent, Name, dl_, dr_, L_, R_, mar1)
	r=0.1*R_
	T=0.1*R_
	braceH=0.8*R_
	alpha=np.degrees(np.arctan2(R_, L_+dl_-dr_))
	rotationIC=180.0-a12(-dr_, R_)/self.d2r
	rotationIC=30-rotationIC
        baseMarkerI=Marker(self.mar1.parent(), "baseMarkerI", pos=(0,0,0), orientation=(0,0,0), ref=self.mar1)
        baseMarkerI_=Marker(self.mar1.parent(), "baseMarkerI_", pos=(0,0,0), orientation=(0,0,-alpha-shift+rotationIC), ref=self.mar1)
	self.Brace=Part(self, "Brace")
	zOri=0
	zBrace=sign*(T/2+braceH/2)
	zOriSym=sign*(T+braceH)
        basemar=Marker(self.Brace, "basemarker",  (0,0,0), (0,0,-alpha-shift+rotationIC), baseMarkerI)
        mar1alignedwithmar2=Marker(self.Brace, "bbasemaralignedwithmar2",  (0,0,0), (0,0,alpha), basemar)  
  	mar2alignedwithmar1=   Marker(self.Brace, "mar2alignedwithmar1", pos=(L_+dl_-dr_, R_, -zOriSym), orientation=(0,0,alpha), ref=basemar)
        revJoint1=Joint(self, "RevJ", basemar, baseMarkerI)
	braceGeoMar=Marker(self.Brace, "braceGeoMar", (r+L_+dl_-dr_, r+braceH/2, -zBrace), (90, -90, -90), ref=basemar)
	pnts=[(T/2, -braceH/2), (braceH/2, -braceH/2), (braceH/2, braceH/2), (T/2, braceH/2), (T/2, braceH/2-T), (braceH/2-T, braceH/2-T), (braceH/2-T, -braceH/2+T), (T/2, -braceH/2+T)]
        Extrusion(self.Brace, "halfBraceL", pnts, 0, 2*r+L_+dl_-dr_, "RED", braceGeoMar)
	pnts=[(-i[0], i[1]) for i in pnts] 
	pnts.reverse()
        Extrusion(self.Brace, "halfBraceR", pnts, 0, 2*r+L_+dl_-dr_, "RED", braceGeoMar)
	
	self.part2=Part(self, "disk2")
  	self.mar2=Marker(self.part2,             "mar2", pos=(L_+dl_-dr_, R_, -zOriSym,), orientation=(0,0,0), ref=basemar)
  	brace2disk=Marker(self.Brace, "brace2disk", pos=(L_+dl_-dr_, R_, -zOriSym,), orientation=(0,0,0), ref=basemar)
  	basemar2alignedwithmar1=   Marker(self.part2, "basemar2alignedwithmar1", pos=(L_+dl_-dr_, R_, -zOriSym,), orientation=(0,0,alpha), ref=basemar)
        revJoint2=Joint(self, "RevJ2", self.mar2, brace2disk)
        baseMarkerII=Marker(self.part2, "baseMarkerII", pos=(0,0,0), orientation=(0,0,0), ref=self.mar2)
  	Cylinder(self.part2, "disk", R_, T, Marker(self.part2, "Cyn_mar", (0,0,-T/2), ref=self.mar2))

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

	slider2link2=Marker(slider, "slider2link2", (L_, 0, -zOriSym), ref=basemar)		
	pnts=[(r*np.cos(i), r*np.sin(i)) for i in np.linspace(180, 360, 10)*self.d2r]
	Extrusion(slider, "sliderblock2", pnts, T/2, braceH, "RED",  slider2link2)

        transJ=Joint(self, "SliderJoint", sliderI, sliderJ, "translational")
        motion=Motion123(self, "sliderMotion", sliderI, sliderJ, 'z', "%f+time/120*%f"%(-dr_, dl_+dr_)) 
        #motion=Motion123(self, "sliderMotion", sliderI, sliderJ, 'z', "0") 

        link1=Part(self, "Link1")
        link12slider=Marker(link1, "toSlider",   ref=slider2link1) 
        pos=(-R_*0.866, R_*0.5, 0)
        link12disk1=Marker(link1, "todisk1",  pos,  ref=basemar) 
	disk12link1=Marker(self.mar1.parent(), "tolink1", pos, ref=baseMarkerI_)
        Link(link1, "link", T, T, link12slider, link12disk1)

	JntSliderLnk1=Joint(self, "Jslider_link1", slider2link1, link12slider)
	JntDisk1Lnk1=Joint(self, "Jdisk1_link1", link12disk1,  disk12link1)
	
        link2=Part(self, "Link2")
        link22slider=Marker(link2, "toSlider",   ref=slider2link2) 
        ang=-a34(-dl_+dr_, R_)
        angic=-a34(-dl_+dr_*0, R_)
        pos=(R_*np.cos(ang), R_*np.sin(ang), 0)
	link22disk2=Marker(link2, "todisk", pos, ref=self.mar2)
	disk22link2=Marker(self.mar2.parent(), "tolink2", pos, ref=baseMarkerII)
	JntDisk2Lnk2=Joint(self, "Jdisk2_link2", link22disk2,  disk22link2)
	
        Link(link2, "link", T, T, link22slider, link22disk2)

	JntSliderLnk2=Joint(self, "Jslider_link2", slider2link2, link22slider)

	rotationIC=(ang-angic)/self.d2r
	shiftedmar=Marker(self.part2, "shiftedmar", (0,0,0), (0, 0, rotationIC+alpha-55), basemar2alignedwithmar1) 
	distalmar=Marker(self.part2, "distalmar", (L_, 0, 0), (0,0,0), ref=shiftedmar)
	Link(self.part2, "link1", T, T, shiftedmar, distalmar) 



if __name__ == "__main__":	
  scale=0.1
  dl=1.3448*scale
  dr=0.9*scale
  L=5*scale
  R=1*scale
  model=Model("sliderActuator", mm="meter", mass="kg", force="newton", icon_size=0.021)
  ground=model.ground()

  mar1=Marker(ground, "ground_marker", (0,0,0), (0, 0, 0))
  p1_disk=Cylinder(ground, "cyn1",  R, 0.1*R, Marker(ground, "toDisk", (0,0,-0.05*R), ref=mar1)) 
  slider=SliderMechanismLean(model, "SLM", dl, dr, L, R, mar1, shift=55)


  lines=model.commands([])
  pf=file("aview.cmd", "w")
  for l in lines:
      pf.write("%s\n"%l)
  pf.write("simulation single trans type= static initial_static=no end_time=120 number_of_steps=120\n")
  pf.close()    
  cmd="c:\\MSC.Software\\Adams\\2016\\common\\mdi.bat aview ru-s i e"
  os.system(cmd)
