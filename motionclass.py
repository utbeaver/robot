#########################################################################
#This file contains the class to define the motion elements, subsystems 
#models in Python. User of this file should agree:
#
#1. The usage should be limited to US Army. It can be freely distributed within US Army.
#
#2. Do not modify and copy any portion of this file during ditribution.
#
#For any question, please contact Dr. Peilin Song at 
#
############################################################################
from math import *
_zeros=(0.0, 0.0, 0.0)
def splitXY(xy, scale=1.0):
  x=[]
  y=[]
  for xy_ in xy:
    x.append(xy_[0]*scale)
    y.append(xy_[1]*scale)
  return (x, y)      

def vec_(p1, p2):
  return [p1[0]-p2[0], p1[1]-p2[1], p1[2]-p2[2]]

def unit(v, f=1):
  l = sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2])
  v[0]=v[0]/l*f
  v[1]=v[1]/l*f
  v[2]=v[2]/l*f
  return (v[0], v[1], v[2])


def dotX(u, v):
  temp =u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
  temp1 = sqrt(u[0]*u[0]+u[1]*u[1]+u[2]*u[2])
  temp2 = sqrt(v[0]*v[0]+v[1]*v[1]+v[2]*v[2])
  return temp/(temp1*temp2)

def crossX(b, c):
  b=unit(b)
  c=unit(c)
  a1=b[1]*c[2]-b[2]*c[1]
  a2=b[2]*c[0]-b[0]*c[2]
  a3=b[0]*c[1]-b[1]*c[0]
  return [a1, a2, a3]

def eulerAngleFromVec(v, f=1):
  v=unit(v, f)      
  theta=acos(v[2])
  if abs(theta) < .00001:
    return (0,0,0)
  #alpha = asin(v[0]/sin(theta))
  alpha = atan2(v[0], -v[1])

  return (alpha*180.0/pi, theta*180.0/pi, 0)

def eulerAngleFromMat(v1, v2, v3):
  (a1, a2, a3)= eulerAngleFromVec(v3)
  a3 = atan2(v1[2], v2[2])
  return (a1, a2, a3)

def leng(p1, p2=(0,0,0)):  
  l1=p1[0]-p2[0]
  l2=p1[1]-p2[1]
  l3=p1[2]-p2[2]
  return sqrt(l1*l1+l2*l2+l3*l3)

def between(hp1, hp2, ratio=.5):
  x=hp1[0]+(hp2[0]-hp1[0])*ratio      
  y=hp1[1]+(hp2[1]-hp1[1])*ratio      
  z=hp1[2]+(hp2[2]-hp1[2])*ratio      
  return [x, y, z]

def dist(p1, p2):
  v=[0, 0,0]
  v[0]=p1[0]-p2[0]
  v[1]=p1[1]-p2[1]
  v[2]=p1[2]-p2[2]
  return v

def arrayToString(name, vals):
  l=len(vals)
  line=" %s="%name
  for i in range(l-1):
    line = "%s%f,"%(line, vals[i])
  line = "%s%f "%(line, vals[l-1])  
  return line

def processPoint(pnts):
  len_ = len(pnts)      
  i=0
  lines=[]
  endl=","
  for p in pnts:      
    i=i+1
    if i == len_:
      endl=" "      
    line = "%f, %f, %f %s&"%(p[0], p[1], p[2], endl)      
    lines.append(line)
  return lines

class entity:
  def __init__(self, parent, Name,  __sep="."):
    self._parent=parent      
    self._sep = __sep
    self.d2r=3.14159/180
    if self._parent != None:
      self._name = self._parent.name()+parent.sep()+Name       
    else:  
      self._name = ".%s"%Name       
    self._lines = [] 
    self._2ndPass = [] 
    self._id = None
    self.container=[]
    if self.parent() != None:
      self.parent().addToContainer(self)
    self._output=False  
    self.name_=Name
    self.vis="on"

  def name(self, short=False):
    if short==False:      
      return self._name 
    else:  
      return self.name_ 

  def parent(self):
    return self._parent 

  def sep(self):
    return self._sep
  
  def Id(self, id=None):
    if id != None:      
      self._id = id
    return self._id  
  
  def addToContainer(self, inst):
    self.container.append(inst)      

  def visual(self, val=None):
    if val != None:
      self.vis=val
    return self.vis

  def commands(self, lines, firstPass=True):
    if hasattr(self, "toAdams") and self._output==False:      
      self.toAdams()
      self._output=True
    for l in self._lines:  
      lines.append(l)
    for c in self.container:    
      if hasattr(c, "toAdams") and c._output==False:      
        c.toAdams()      
        c._output=True
      lines=c.commands(lines)      
    for l in self._2ndPass:  
      lines.append(l)
    lines.append("view zoom auto=on")
    return lines  

 
class Road(entity):
  def __init__(self, parent, Name, fileName, pos=(0,0,0), ori=(0,0,0)):
    entity.__init__(self, parent, Name)      
    self.fName=fileName
    self.pos=pos
    self.ori=ori

  def toAdams(self):    
    p=self.pos
    o=self.ori
    line = 'atire road create road_name=%s part= ground road_property_file="%s" location=%f, %f, %f orientation=%f, %f, %f'%(self.name(True), self.fName, p[0], p[1], p[2], o[0], o[1], o[2])  
    self._lines.append(line)  

class Marker(entity):   
  def __init__(self, parent, Name, pos=(0,0,0), orientation=(0,0,0), ref=None, adams_id=None):
    entity.__init__(self, parent, Name)      
    self.cm = Name=="cm"
    self._pos = pos
    self._ang = orientation
    self._ref = ref
    if self._ref == None:
      self._ref = "ground"      
    else:
      self._ref=self._ref.name()      
    if adams_id != None:  
      self.Id(adams_id)  

  def position(self): return self._pos  
  def angles(self): return self._ang

  def toAdams(self):    
    line =  'marker create marker_name=%s location=%f, %f, %f orientation=%f, %f, %f relative_to=%s '%(self.name(), self._pos[0], self._pos[1], self._pos[2], self._ang[0], self._ang[1], self._ang[2], self._ref) 
    if self.Id() != None:
      line = line + "adams_id=%d"%self.Id()
    self._lines.append(line)  
    self._lines.append("\nentity attributes entity_name=%s visibility=%s color=.colors.GREEN entity_scope=all_color"%(self.name(), self.visual())) 
      

class Tire(entity):
  def __init__(self, parent, Name, road, mass, I, fName, left, pos, ori=(0,-90,0)):
    entity.__init__(self, parent, Name)      
    self.r=road
    self.m=mass
    self.I=I
    self.fName=fName
    self.lr=left
    self.pos=pos
    self.ori=ori
    self._cm = entity(None, "%s.wheel_part.wheel_cm"%Name) 

          
  def cm(self): return self._cm
  def toAdams(self):    
    line = 'atire wheel_tire create wheel_name=%s side=%s mass=%f Ixx_Iyy=%f Izz=%f center_offset=0 tire_property_file="%s" road_name=%s location=%f, %f, %f orientation=%f, %f, %f\n'%(self.name(True), self.lr, self.m, self.I[0], self.I[1], self.fName, self.r.name(), self.pos[0], self.pos[1], self.pos[2], self.ori[0], self.ori[1], self.ori[2])    
    self._lines.append(line)  


class FloatMarker(entity):
  def __init__(self, parent, Name):
    entity.__init__(self, parent, Name)      

  def toAdams(self):    
    line = "floating_marker create floating_marker_name=%s\n"%self.name()
    self._lines.append(line)  

class Spline(entity):
  def __init__(self, parent, Name, x, y, adams_id=None):
    entity.__init__(self, parent, Name)      
    self._x=x 
    self._y=y
    self.Id(adams_id) 

  def toAdams(self):    
    if self.Id()==None:
      self._lines.append("data_element create spline spline_name=%s&"%self.name())
    else:  
      self._lines.append("data_element create spline spline_name=%s adams_id=%d&"%(self.name(), self.Id()))
    _x="x="
    _y="y="
    len_=len(self._x)
    for i in range(len_-1):
      _x =_x + str(self._x[i])+", " 
      _y =_y + str(self._y[i])+", " 
    _x = _x + str(self._x[len_-1])+" &"  
    _y = _y + str(self._y[len_-1])+" &"  
    self._lines.append(_x)
    self._lines.append(_y)
    self._lines.append("linear_extrapolate=no units=no_units")


class Spline3D(entity):
  def __init__(self, parent, Name, x, y, z, adams_id=None):
    entity.__init__(self, parent, Name)      
    self._x=x 
    self._y=y 
    self._z=z 
    self.Id(adams_id) 
    
  def toAdams(self):    
    if self.Id()==None:
      self._lines.append("data_element create spline spline_name=%s&"%self.name())
    else:  
      self._lines.append("data_element create spline spline_name=%s adams_id=%d&"%(self.name(), self.Id()))
    _x="x="
    _y="y="
    _z="z="
    xlen_=len(self._x)
    for i in range(xlen_-1):
      _x =_x + str(self._x[i])+", " 
    ylen_=len(self._y)
    for i in range(ylen_-1):
      _y =_y + str(self._y[i])+", " 
    zlen_=len(self._z)
    for i in range(zlen_-1):
      _z =_z + str(self._z[i])+", " 
    _x = _x + str(self._x[xlen_-1])+" &"  
    _y = _y + str(self._y[ylen_-1])+" &"  
    _z = _z + str(self._z[zlen_-1])+" &"  
    self._lines.append(_x)
    self._lines.append(_y)
    self._lines.append(_z)
    self._lines.append("linear_extrapolate=no units=no_units")

class Polyline(entity):
  def __init__(self, parent, Name, pnts, ref=None, close="no"):
    entity.__init__(self, parent, Name)      
    self.refName = "ground"
    if ref != None:
      self.refName = ref.name()      
    self._pnts = pnts
    self.close=close

  def toAdams(self):    
    line = "geometry create curve polyline polyline_name=%s relative_to=%s location=&"%(self.name(), self.refName)
    self._lines.append(line)  
    lines = processPoint(self._pnts)
    for line in lines:
      self._lines.append(line)      
    self._lines.append("close=%s"%self.close)  

class Extrusion(entity):    
  def __init__(self, parent, Name, pnts, Z, depth, color, ref): 
    entity.__init__(self, parent, Name)      
    self.refName = "ground"
    if ref != None:
      self.refName = ref.name()      
    self._pnts = pnts
    self._depth=depth
    self._color = color
    self._Z = Z
    parent.geometry(self)
    parent.primitiveGeo()

  def toAdams(self):    
    line = "geometry create shape extrusion extrusion_name = %s reference_marker=%s  points_for_profile= &"%(self.name(), self.refName)
    self._lines.append(line)  
    for xy in self._pnts:
      self._lines.append("%f, %f, %f, &"%(xy[0], xy[1], self._Z))      
    xy=self._pnts[0]  
    self._lines.append("%f, %f, %f &"%(xy[0], xy[1], self._Z))      
    self._lines.append("length_along_z_axis=%f analytical=yes &"%self._depth)
    self._lines.append("relative_to=%s"%self.refName) 
    self._lines.append("entity attributes entity_name=%s type_filter=Extrusion visibility=%s color=.colors.%s entity_scope=all_color"%(self.name(), self.visual(), self._color)) 
    self._lines.append("geometry attributes geometry=%s render=filled"%self.name())


class Link(entity):    
  def __init__(self, parent, Name, w, d, mar1, mar2, color="GREEN"):      
    entity.__init__(self, parent, Name)      
    self._w=w
    self._d=d
    self._color = color
    self._mar1=mar1
    self._mar2=mar2
    parent.geometry(self)
    parent.primitiveGeo()


  def toAdams(self):    
    self._lines.append("geometry create shape link link_name=%s width=%f depth=%f i_marker=%s j_marker=%s\n"%(self.name(), self._w, self._d, self._mar1.name(), self._mar2.name()))
    #self._lines.append("\nentity attributes entity_name=%s type_filter=Extrusion visibility=%s color=.colors.%s entity_scope=all_color"%(self.name(), self.visual(), self._color)) 
    self._lines.append("\nentity attributes entity_name=%s type_filter=Extrusion visibility=%s color=.colors.%s entity_scope=all_color"%(self.name(), self.visual(), self._color)) 

class Ellipsoid(entity):
  def __init__(self, parent, Name, rx, ry, rz, ref, color="WHITE"):
    entity.__init__(self, parent, Name)      
    self.rx=rx
    self.ry=ry
    self.rz=rz
    self.ref=ref
    self._color=color
    parent.geometry(self)
    parent.primitiveGeo()

  def toAdams(self):
    line = "geometry create shape ellipsoid ellipsoid_name=%s x_scale_factor=%f y_scale_factor=%f  z_scale_factor=%f  center_marker=%s"%(self.name(), self.rx*2, self.ry*2, self.rz*2, self.ref.name()) 
    self._lines.append(line)
    self._lines.append("\nentity attributes entity_name=%s color=.colors.%s\n "%(self.name(), self._color)) 
          

class Box(entity):
  def __init__(self, parent, Name, l, w, t, ref, color="WHITE"):
    entity.__init__(self, parent, Name)      
    self._l=l
    self._w=w
    self._t=t
    self._ref=ref
    self._color = color
    parent.geometry(self)
    parent.primitiveGeo()
    

  def toAdams(self):
    self._lines.append("geometry create shape block block_name=%s diag_corner_coords=(%f), (%f), (%f) corner_marker=%s"%(self.name(), self._l, self._w, self._t, self._ref.name()))      
    #self._lines.append("\nentity attributes entity_name=%s type_filter=Block visibility=no_opinion color=.colors.%s entity_scope=all_color"%(self.name(), self._color)) 
    self._lines.append("\nentity attributes entity_name=%s type_filter=Block visibility=%s color=.colors.%s entity_scope=all_color"%(self.name(), self.visual(), self._color)) 
          
class Plate(entity):	  
  def __init__(self, parent, Name, r, w, mars, color="GREEN"):    
    entity.__init__(self, parent, Name)      
    self._r=r
    self._w=w
    self.markers=mars
    parent.geometry(self)
    parent.primitiveGeo()
      
  def toAdams(self):    
    tempstr="marker_name="+self.markers[0].name()	  
    for mar in self.markers[1:]:
      tempstr="%s, %s"%(tempstr, mar.name())	    
    self._lines.append("geom create shape plate plate=%s %s radius=%f width=%f"%(self.name(), tempstr, self._r, self._w)) 	  

class Cylinder(entity):    
  def __init__(self, parent, Name, r, l, ref, color="GREEN"):    
    entity.__init__(self, parent, Name)      
    self._r=r
    self._l=l
    self._ref=ref
    self._color = color
    parent.geometry(self)
    parent.primitiveGeo()


  def toAdams(self):    
    self._lines.append("geometry create shape cylinder cylinder_name=%s length=%f radius=%f  angle=359.0 center_marker=%s"%(self.name(), self._l, self._r, self._ref.name()))
    self._lines.append("\nentity attributes entity_name=%s type_filter=Cylinder visibility=%s color=.colors.%s entity_scope=all_color"%(self.name(), self.visual(), self._color)) 

class PointMass(entity):
  def __init__(self, parent, Name, mass, pos, ref):
    entity.__init__(self, parent, Name)      
    self._cm = Marker(self, "cm", pos, (0,0,0), ref)
    self._mass = mass
    self._pos = pos

  def cm(self):    
    return self._cm      

  def position(self): return self._pos

  def toAdams(self):    
    self._lines.append("part create point_mass name_and_position point_mass_name = %s\n"%(self.name()))
    self._2ndPass.append("part modify point_mass mass_properties point_mass_name = %s  center_of_mass_marker=%s mass=%s\n"%(self.name(), self._cm.name(), self._mass))


class Part(entity):
  def __init__(self, parent, Name="ground", mass=0.0, I=(0.0, 0.0, 0.0, 0.0, 0.0, 0.0), pos=_zeros, ori=_zeros, ref=None, adams_id=None):       
    entity.__init__(self, parent, Name)      
    self._cm = Marker(self, "cm", pos, ori, ref, adams_id)
    self._mass = mass
    self._I = I
    self.ground=False
    self.geo=[]
    self.priGeo=True
    if Name == "ground":
      self.ground=True
    self.VW=None  


  def mass(self):
    return self._mass

  def I(self):
    return self._I

  def initVW(self, vw):
    tokens=("vm", "wm", "vx", "vy", "vz", "wx", "wy", "wz")	  
    self.VW=[]
    for i in range(8):
      if vw[i] is None:
        self.VW.append(" &\n")
      else:	
        self.VW.append("%s=%s &\n"%(tokens[i], str(vw[i])))
       	      
  def cm(self):    
    return self._cm      

  def primitiveGeo(self, val=True):
    self.priGeo=val

  def geometry(self, para=None, ref=None):  
    if para == None:      
      return self.geo      
    else:  
      if ref!=None:      
        self.geo.append((para, ref))      
      else:  
        self.geo.append((para, self._cm))      
      return self.geo
      
  def massProperties(self, cm_name):
    line=""      
    if len(self.geo)==0 or self.priGeo==False:      
      line = line+'part modify rigid_body mass_properties part_name=%s center_of_mass_marker=%s\n'%(self.name(), cm_name.name())
      line = line+'part modify rigid_body mass_properties part_name=%s mass=%f\n'%(self.name(), self.mass())
      line = line+'part modify rigid_body mass_properties part_name=%s ixx=%f iyy=%f izz=%f ixy=%f izx=%f iyz=%f\n'%(self.name(), self.I()[0], self.I()[1], self.I()[2], self.I()[3], self.I()[4], self.I()[5])
    for geo in self.geo:      
      if self.priGeo==True:
        line = line+'part mod rigid_body mass_properties part_name=%s material_type = steel\n'%(self.name()) 
      else:  
        line = line+'file parasolid read file_name="%s" part_name=%s relative_to=%s\n'%(geo[0], self.name(), geo[1].name())        
    if self.VW is not None:
      line=line+"part modify rigid_body initial_velocity part_name=%s &\n"%self.name()
      for i in self.VW:
        line=line+i
    self._2ndPass.append(line)
    
  def toAdams(self):    
    if self.ground: return      
    line = "part create rigid_body name_and_position part_name=%s"%self.name()      
    self._lines.append(line)  
    self.massProperties(self.cm())  
    if self.priGeo==True:
      line = 'part mod rigid_body mass_properties part_name=%s material_type = steel\n'%(self.name()) 
      self._lines.append(line)  
            



class Coupler(entity):
  def __init__(self, parent, Name, Js, lamds):      
    entity.__init__(self, parent, Name)      
    self.Js=Js
    self.lmd=lamds
    self.num=len(Js)
    
  def toAdams(self):    
    if self.num == 3:      
      line = "constraint create complex_joint coupler coupler_name=%s joint_name=%s, %s, %s motion_multipliers=%f,%f,%f"%(self.name(), self.Js[0].name(), self.Js[1].name(), self.Js[2].name(), self.lmd[0], self.lmd[1], self.lmd[2]) 
      self._lines.append(line)
    else:  
      line = "constraint create complex_joint coupler coupler_name=%s joint_name=%s, %s motion_multipliers=%f,%f"%(self.name(), self.Js[0].name(), self.Js[1].name(), self.lmd[0], self.lmd[1]) 
      self._lines.append(line)

class SparseMatrix(entity):
  def __init__(self, parent, Name, datas):    
    entity.__init__(self, parent, Name)      
    self.datas=datas

  def toAdams(self):    
    line='data_element create matrix sparse matrix_name=%s row_index=%s column_index=%s values=%s'%(self.name(), self.datas[0], self.datas[1], self.datas[2])	  
    self._lines.append(line)

class Reqsub( entity):
  def __init__(self, parent, Name, func):    
    entity.__init__(self, parent, Name)      
    self._f=func
	
  def toAdams(self):    
    line='output_control create request request_name=%s  user_function=%s routine="%s"\n'%(self.name(), self._f[0], self._f[1])      	  
    line=line+'output_control set output reqsave = on'
    self._lines.append(line)

class Reqvar( entity):
  def __init__(self, parent, Name, var):    
    entity.__init__(self, parent, Name)      
    self._f=var
	
	
  def toAdams(self):    
    line='output_control create request request_name=%s  variable_name=%s\n'%(self.name(), self._f.name())      	  
    line=line+'output_control set output reqsave = on'
    self._lines.append(line)

class DV(entity):
  def __init__(self, parent, Name, val, perc):    
    entity.__init__(self, parent, Name)      
    self.val=val
    self.perc=perc
  	

  def toAdams(self):    
    line = 'variable  create variable_name=%s real=%f delta_type=percent_relative range=-%f, %f use_range=yes'%(self.name(), self.val, self.perc, self.perc)      
    self._lines.append(line)

class Diff(entity):
  def __init__(self, parent, Name, func, implicit="off"):    
    entity.__init__(self, parent, Name)      
    self._f=func
    self._i=implicit

  def toAdams(self):    
    line='part create equation differential_equation differential_equation_name=%s initial_condition=0 static_hold=off function=\"%s\" implicit=\"%s\"'%(self.name(), self._f, self._i)
    self._lines.append(line)

class Variable(entity):
  def __init__(self, parent, Name, func):    
    entity.__init__(self, parent, Name)      
    self._f=func

  def toAdams(self):    
    line = 'data_element create variable variable_name=%s function="%s"'%(self.name(), self._f)      
    self._lines.append(line)

class Measure(entity):
  def __init__(self, parent, Name, func):    
    entity.__init__(self, parent, Name)      
    self._f=func


  def toAdams(self):    
    line = 'measure create function measure=%s function="%s" create_measure_display=no'%(self.name(), self._f)      
    self._lines.append(line)

class CompMeasure(entity):    
  def __init__(self, parent, Name, obj, charact, comp, ref):		
    entity.__init__(self, parent, Name)      
    self.obj=obj
    self.charact=charact
    self.comp=comp
    self.ref=ref

  def toAdams(self):    
    line='measure create object measure_name=%s object=%s characteristic="%s" component="%s" from_first=yes coordinate_rframe=%s'%(self.name(), self.obj.name(), self.charact, self.comp, self.ref.name()) 			  
    self._lines.append(line)


class Varsub(entity):
  def __init__(self, parent, Name, func):    
    entity.__init__(self, parent, Name)      
    self._f=func

  def toAdams(self):    
    line = 'data_element create variable variable_name=%s user_function=%s routine="%s"'%(self.name(), self._f[0], self._f[1])      
    self._lines.append(line)

class Array(entity):
  def __init__(self, parent, Name, _list, type="U", adams_id=None):    
    entity.__init__(self, parent, Name)      
    self._list=_list
    self._type=type
    self.Id(adams_id)

  def toAdams(self):    
    line=""	  
    if self._type == "U" or self._type=="IC":
       t={"U":"u_input", "IC":"ic"}	    
       t_={"U":"variable", "IC":"number"}	    
       if self.Id()==None:
         line = "data create array %s array_name=%s "%(t[self._type], self.name())
       else:	 
         line = "data create array %s array_name=%s adams_id=%d "%(t[self._type], self.name(), self.Id())
       line = line + "%s="%t_[self._type]
       for i in range(len(self._list)-1):
         line=line+ str(self._list[i])+", "
       line=line+str(self._list[len(self._list)-1]) 
    else:
       t={"X":"x_state", "Y":"y_output", "G":"gerneral"}	    
       if self.Id()==None:
         line = "data create array %s array_name=%s size=%d\n"%(t[self._type], self.name(), self._list)
       else:	 
         line = "data create array %s array_name=%s size=%d adams_id=%d\n"%(t[self._type], self.name(), self._list, self.Id())
    self._lines.append(line)

class Gcon(entity):
  def __init__(self, parent, Name, func):    
    entity.__init__(self, parent, Name)      
    self._f=func

  def toAdams(self):
    line = 'constraint create general_constraint general_constraint_name=%s function="%s"'%(self.name(), self._f)
    self._lines.append(line)
	
class Gse(entity):	
  def __init__(self, parent, Name, _U, _X, _Y, _ic,  nx, ny, _paras, _dll, hold="on"):    
    entity.__init__(self, parent, Name)      
    self.U=_U
    self.Y=_Y
    self.X=_X
    self.IC=_ic
    self.paras=_paras
    self.routine=_dll
    self.NX=nx
    self.NY=ny
    self.hold=hold

  def toAdams(self):
    line="part create equation general_state_equation general_state_equation_name=%s u_input_array_name=%s y_output_array_name=%s x_state_array_name=%s ic_array_name=%s &\n "%(self.name(), self.U.name(), self.Y.name(), self.X.name(),self.IC.name()) 	  
    line=line+'user_function=0 interface_routines=(eval({"%s::", "%s::", "%s::", "%s::"}))&\n'%(self.routine,  self.routine,  self.routine,  self.routine)  
    line=line+'static_hold=%s state_equation_count=%d output_equation_count=%d\n'%(self.hold, self.NX, self.NY)
    self._lines.append(line)
    line="part mod equation general_state_equation general_state_equation_name =%s user_function=%s"%(self.name(), self.paras)
    self._2ndPass.append(line)


class GseSampled(entity):	
  def __init__(self, parent, Name, _U,  _DX, _Y,  ndx, ny, _paras, _dll, delta):    
    entity.__init__(self, parent, Name)      
    self.U=_U
    self.Y=_Y
    self.DX=_DX
    self.paras=_paras
    self.routine=_dll
    self.NY=ny
    self.NDX=ndx
    self.delta=delta

  def toAdams(self):
    line='part create equation general_state_equation general_state_equation_name=%s u_input_array_name=%s y_output_array_name=%s discrete_state_array_name=%s sample_period="%f" &\n '%(self.name(), self.U.name(), self.Y.name(), self.DX.name(), self.delta) 	  
    line=line+'user_function=0 interface_routines=(eval({"%s::", "%s::", "%s::", "%s::"}))&\n'%(self.routine,  self.routine,  self.routine,  self.routine)  
    line=line+'state_equation_count=0 output_equation_count=%d discrete_state_equation_count = %d\n '%(self.NY, self.NDX)
    self._lines.append(line)
    line="part mod equation general_state_equation general_state_equation_name =%s user_function=%s"%(self.name(), self.paras)
    self._2ndPass.append(line)

class Connector(entity):    
  def __init__(self, parent, Name, marI, marJ, type):    
    entity.__init__(self, parent, Name)      
    self._I=marI
    self._J=marJ
    self._type=type
    self._graphics=False

  def graphics(self): 
    self._graphics=True

  def forceGraphics(self):
      return "geometry create shape force force_name=%s_graphics force_element_name=%s applied_at_marker_name=%s"%(self.name(), self.name(), self.I().name())     
  def I(self): return self._I;
  def J(self): return self._J; 
  def type(self): return self._type

class Motion123(Connector):
  def __init__(self, parent, Name, marI, marJ, _type, func, dva="displacement"):    
    Connector.__init__(self, parent, Name, marI, marJ, _type)      
    self.func=func
    self.dva=dva

  def toAdams(self):    
    line = 'constraint create motion_generator axis=%s motion_name=%s i_marker_name=%s j_marker_name=%s time_derivative=%s function="%s"'%(self.type(), self.name(), self.I().name(), self.J().name(), self.dva, self.func)
    self._lines.append(line)


class Joint(Connector):  
  def __init__(self, parent, Name, marI, marJ, _type="revolute", _jprim=False, motion=None):    
    Connector.__init__(self, parent, Name, marI, marJ, _type)      
    self.jprim=_jprim
    self.motion=motion
    if self.motion is not None:
      self.motionN="%s_motion"%self.name()	    

  def toAdams(self):    
    if self.jprim == False:        
      line = "constraint create joint %s joint_name=%s i_marker_name=%s j_marker_name=%s"%(self.type(), self.name(), self.I().name(), self.J().name())
      if self.motion is not None:
          line=line+'\nconstraint create motion_generator motion_name=%s type_of_freedom=%s joint_name=%s  function="%s"'%(self.motionN, self.type(), self.name(), self.motion)	      
    else:  
      line = "constraint create primitive_joint %s jprim_name=%s i_marker_name=%s j_marker_name=%s"%(self.type(), self.name(), self.I().name(), self.J().name())
    self._lines.append(line)

  def motionName(self):  
    return self.motionN	  
   	  


class SPDPT(Connector):
  def __init__(self, parent, Name, marI, marJ, K, C, F=0, D=0, length=0, _type="translational"):      
    Connector.__init__(self, parent, Name, marI, marJ, _type)      
    self.K=K
    self.C=C
    self.D=D
    self.F=F
    self.length=length
    
  def toAdams(self):  
    if self.type() == "translational":      
      line = "force create element_like translational_spring_damper spring_damper_name=%s i_marker_name=%s j_marker_name=%s stiffness=%f damping=%f displacement_at_preload=%f preload=%f"%(self.name(), self.I().name(), self.J().name(), self.K, self.C, self.D, self.F)   
    else:  
      line = "force create element_like rotational_spring_damper spring_damper_name=%s i_marker_name=%s j_marker_name=%s stiffness=%f damping=%f displacement_at_preload=%f preload=%f"%(self.name(), self.I().name(), self.J().name(), self.K, self.C, self.D, self.F)   
    self._lines.append(line)
    line = "geometry create shape spring_damper spring_damper_name=%s i_marker_name=%s j_marker_name=%s\n"%(self.name()+"gra", self.I().name(), self.J().name()) 
    if self.K > .00001:
      l=self.length      
      line = line+"geometry modify shape spring_damper spring_damper_name=%s coil_count=10 diameter=%f\n"%(self.name()+"gra", l/5) 
    self._lines.append(line)
    if self.C > .00001:
      l=self.length      
      line = "geometry modify shape spring_damper spring_damper_name=%s damper_diameter_at_ij=%f, %f cup_length_at_ij=%f, %f\n"%(self.name()+"gra", l/8, l/9, l/2, l/2) 
      self._lines.append(line)
          
class Sforce(Connector):
  def __init__(self, parent, Name, marI, marJ, userStr, _type="translational", actiononly="off"):      
    Connector.__init__(self, parent, Name, marI, marJ, _type)      
    self._userStr = userStr
    self.only=actiononly

  def toAdams(self):  
    line = 'force create direct single_component_force single_component_force_name=%s type_of_freedom=%s action_only=%s i_marker_name=%s j_marker_name=%s function="%s"'%(self.name(), self.type(), self.only, self.I().name(), self.J().name(), self._userStr) 
    self._lines.append(line)

class SforceSub(Connector):
  def __init__(self, parent, Name, marI, marJ, userStr, _type="translational", actiononly="off"):      
    Connector.__init__(self, parent, Name, marI, marJ, _type)      
    self._userStr = userStr
    self.only=actiononly

  def toAdams(self):  
    line = 'force create direct single_component_force single_component_force_name=%s type_of_freedom=%s action_only=%s i_marker_name=%s j_marker_name=%s user_function=%s  routine="%s"'%(self.name(), self.type(), self.only, self.I().name(), self.J().name(), self._userStr[0], self._userStr[1]) 
    self._lines.append(line)

class FieSub(Connector):
  def __init__(self, parent, Name, MarI, MarJ, UserStr):      
    Connector.__init__(self, parent, Name, MarI, MarJ, "Field")      
    self._userStr = UserStr

  def toAdams(self):  
    line = 'force create element_like field field_name=%s i_marker_name=%s j_marker_name=%s user_function=%s  routine="%s" '%(self.name(), self.I().name(), self.J().name(), self._userStr[0], self._userStr[1])
    self._lines.append(line)

class Field(Connector):
  def __init__(self, parent, Name, MarI, MarJ, K, C, L=(0,0,0,0,0,0), F=(0,0,0,0,0,0)):      
    Connector.__init__(self, parent, Name, MarI, MarJ, "Field")      
    self.K=K
    self.C=C
    self.L=L
    self.F=F

  def toAdams(self):  
    line = "force create element_like field field_name=%s i_marker_name=%s j_marker_name=%s "%(self.name(), self.I().name(), self.J().name())
    line="% sdamping_ratio=%f "%(line, self.C)
    line = line + arrayToString("stiffness_matrix", self.K)
    line = line + arrayToString("translation_at_preload", self.L[:3])
    line = line + arrayToString("rotation_at_preload", self.L[3:])
    line = line + arrayToString("force_preload", self.F[:3])
    line = line + arrayToString("torque_preload", self.F[3:])
    self._lines.append(line)
    if self._graphics==True:
      self._lines.append(self.forceGraphics())

class Beam(Connector):
  def __init__(self, parent, Name, marI, marJ, Y, S, ixx, iyy, izz, yratio, zratio, A, length, C):      
    Connector.__init__(self, parent, Name, marI, marJ, "beam")      
    self._ixx=ixx
    self._iyy=iyy
    self._izz=izz
    self._yr=yratio
    self._zr=zratio
    self._A=A
    self._len=length
    self._C=C
    self._Y=Y
    self._S=S

  def toAdams(self):  
    line = "force create element_like beam beam_name=%s i_marker_name=%s j_marker_name=%s ixx = %e iyy = %e izz= %s y_shear_area_ratio = %f z_shear_area_ratio = %f youngs_modulus = %f  shear_modulus=%f area_of_cross_section = %e length = %f damping_ratio = %f"%(self.name(), self.I().name(), self.J().name(), self._ixx, self._iyy, str(self._izz), self._yr, self._zr, self._Y, self._S, self._A, self._len, self._C) 
    self._lines.append(line)
                    



class Bushing(Connector):  
  def __init__(self, parent, Name, marI, marJ, _K, _C, _tK, _tC, _preload=(0,0,0,0,0,0)):      
    Connector.__init__(self, parent, Name, marI, marJ, "bushing")      
    self._K=_K
    self._C=_C
    self._tK=_tK
    self._tC=_tC
    self.preload=_preload

  def toAdams(self):  
    line = "force create element_like bushing bushing_name=%s i_marker_name=%s j_marker_name=%s stiffness=%f, %f, %f damping=%f, %f, %f tstiffness=%f, %f, %f tdamping=%f, %f, %f"%(self.name(), self.I().name(), self.J().name(), self._K[0], self._K[1], self._K[2], self._C[0], self._C[1], self._C[2], self._tK[0], self._tK[1], self._tK[2], self._tC[0], self._tC[1], self._tC[2])
    self._lines.append(line)
    line = "force modify element_like bushing force_preload=%f, %f, %f torque_preload=%f, %f, %f"%(self.preload[0], self.preload[1], self.preload[2], self.preload[3], self.preload[4], self.preload[5]) 
    self._lines.append(line)

class Forces(Connector):    
  def __init__(self, parent, Name, I_, J_, K_, fExp, type, num=None):      
    Connector.__init__(self, parent, Name, I_, J_, type)      
    self.rm = K_
    self.num=num
    self.Expr=fExp

  def Num(self): return self.num      
  def Expressions(self): return self.Expr      
  def RM(self): return self.rm

class Gforce(Forces):
  def __init__(self, parent, Name, I_, J_, K_,  fExp, adams_id=None):      
    Forces.__init__(self, parent, Name, I_, J_, K_, fExp, "Gforce", 6)      
    self.Id(adams_id)

  def toAdams(self):
    line="force create direct general_force general_force_name=%s i_marker_name=%s j_floating_marker_name=%s ref_marker_name=%s x_force_function=\"%s\" y_force_function=\"%s\" z_force_function=\"%s\" x_torque_function=\"%s\" y_torque_function=\"%s\" z_torque_function=\"%s\""%(self.name(), self.I().name(), self.J().name(), self.RM().name(), self.Expressions()[0], self.Expressions()[1], self.Expressions()[2], self.Expressions()[3], self.Expressions()[4], self.Expressions()[5])
    if self.Id() != None:
      line = line + " adams_id=%d"%self.Id()      
    self._lines.append(line)
    self._lines.append(self.forceGraphics())


class GforceSub(Forces):
  def __init__(self, parent, Name, I_, J_, K_,  fExp, adams_id=None):      
    Forces.__init__(self, parent, Name, I_, J_, K_, fExp, "Gforce", 2)      
    self.Id(adams_id)

  def toAdams(self):
    line="force create direct general_force general_force_name=%s i_marker_name=%s j_floating_marker_name=%s ref_marker_name=%s user_function=%s routine=\"%s\""%(self.name(), self.I().name(), self.J().name(), self.RM().name(), self.Expressions()[0], self.Expressions()[1])
    if self.Id() != None:
      line = line + " adams_id=%d"%self.Id()      
    self._lines.append(line)
    self._lines.append(self.forceGraphics())

class Nforce(entity):
  def __init__(self, parent, Name, I_, J_, stiff, damp): 
    entity.__init__(self, parent, Name)      
    self.Is=I_
    self.J=J_
    self.sM=stiff
    self.damp=damp

  def toAdams(self):
    l=len(self.Is)
    _names=""
    for i in range(l):
      sep=","	    
      if i==l-1:
       sep=" "	      
      _names="%s %s%s "%(_names, self.Is[i].name(), sep)	    
    line='force create direct multi_point_force multi_point_force_name=%s i_marker_name=%s j_marker_name=%s  stiffness_matrix_name=%s damping_ratio=%f'%(self.name(), _names, self.J.name(), self.sM.name(), self.damp) 	  
    self._lines.append(line)

    
class VforceSub(Forces):
  def __init__(self, parent, Name, I_, J_, K_,  fExp, adams_id=None):      
    Forces.__init__(self, parent, Name, I_, J_, K_, fExp, "Vforce", 2)      
    self.Id(adams_id)

  def toAdams(self):
    line="force create direct force_vector force_vector_name=%s i_marker_name=%s j_floating_marker_name=%s ref_marker_name=%s user_function=%s routine=\"%s\""%(self.name(), self.I().name(), self.J().name(), self.RM().name(), self.Expressions()[0], self.Expressions()[1])
    if self.Id() != None:
      line = line + " adams_id=%d"%self.Id()      
    self._lines.append(line)
    self._lines.append(self.forceGraphics())

class Vforce(Forces):
  def __init__(self, parent, Name, I_, J_, K_,  fExp, adams_id=None):      
    Forces.__init__(self, parent, Name, I_, J_, K_, fExp, "Vforce", 3)      
    self.Id(adams_id)

  def toAdams(self):
    line="force create direct force_vector force_vector_name=%s i_marker_name=%s j_floating_marker_name=%s ref_marker_name=%s x_force_function=\"%s\" y_force_function=\"%s\" z_force_function=\"%s\""%(self.name(), self.I().name(), self.J().name(), self.RM().name(), self.Expressions()[0], self.Expressions()[1], self.Expressions()[2])
    if self.Id() != None:
      line = line + " adams_id=%d"%self.Id()      
    self._lines.append(line)
    if self._graphics==True:
      self._lines.append(self.forceGraphics())


class Sensor(entity):
  def __init__(self, parent, Name, func, actions=[("return","on")], comp="ge", value=0.0):      
    entity.__init__(self, parent, Name)      
    self.func=func
    self.acts=actions
    self.comp=comp
    self.va=value

  def toAdams(self):
    vals={ 
		    "bisection": "off",
		    "time_error": "1.0e-6",
		    "error": "1.0e-3",
		    "return": '"off"',
		    "halt": '"off"',
		    "codgen": 'off',
		    "restart": 'off',
		    "yydump": 'off',
		    "print": 'off',
		    }
    line="executive_control create sensor sensor_name=%s "%self.name()
    line = line + 'function="%s" '%self.func
    line = line + 'compare="%s" '%self.comp
    line = line + 'value=%f '%self.va
    for key in vals.keys():
      val=vals[key]
      if key in self.acts.keys():
        val=self.acts[key]
      line=line+'%s=%s '%(key, val)	
    self._lines.append(line)

            

class Model(entity):
  def __init__(self, Name="model_1", mm="inch", mass="pound", force="pound_force", icon_size=1):      
    entity.__init__(self, None, Name)      
    self.ori=(0.0, -90.0, -90.0)
    self._ground = Part(self)
    self._center=Marker(self._ground, "aligned", (0,0,0), self.ori)
    self.length=mm
    self.mass=mass
    self.force = force
    self.icon_size=icon_size
    self.gra=[0, -1, 0]

  def graV(self, vec):
    self.gra = vec

  def ground(self):      
    return self._ground      

  def alignedGround(self): return self._center  

  def toAdams(self):  
    line = "default units len=%s mass=%s force=%s"%(self.length, self.mass, self.force)
    self._lines.append(line)
    line = 'model create model=%s fit_to_view=no'%self.name()
    self._lines.append(line)
    line = 'part attrib part_name=ground name_vis=off'
    self._lines.append(line)
    line = 'part modify rigid_body mass_properties part_name=ground material=.materials.steel'
    self._lines.append(line)
    if self.length == "inch":
      val = 386.0885826772       
    elif self.length=="meter":  
      val =  9806.65/1000 
    else:  
      val =  9806.65 
    line = 'force create body gravitational gravity=gravity x_comp=%f y_comp=%f z_comp=%f'%(val*self.gra[0], val*self.gra[1], val*self.gra[2])
    self._lines.append(line)
    line = "default attr size_of_icon=%f \nmodel attr model=%s size_of_icon=%f"%(self.icon_size, self.name(), self.icon_size)
    self._lines.append(line)
    line = "output set results model = %s formatted = off\n output set results model =%s xrf = off"%(self.name(), self.name())
    self._lines.append(line)
    line = "int dialog dis dialog=.gui.moag"
    self._lines.append(line)
    line = "simulation set choice=cplusplus"
    self._lines.append(line)
    line = "defaults command_file on_error = ignore_command echo_commands = off update_screen = off"
    self._lines.append(line)
    line = "executive set numerical model = %s integrator = hht"%self.name()
    self._lines.append(line)
    line="executive set numerical model = %s hmax = 1.0e-3"%self.name()
    self._lines.append(line)

  def toFile(self, f, cmd=None):
    lines=self.commands([])	  
    pf=file(f, "w")
    for l in lines: pf.write("%s\n"%l)
    if cmd is not None:
      pf.write("%s\n"%cmd)	    
    pf.close()
