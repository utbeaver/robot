##########################################################################################
# Name:                    model.py
# Purpose:                 classes for Vehicle Systems

#
# Created:                 April 16, 2008
# Revison:                 
##########################################################################################
import wx
import wx.lib.ogl as ogl
import  wx.lib.rcsizer  as rcs

class systemBase:
  def __init__(self, _name = "abstractSystem"):
    self.name = _name
    self.subSystems=[]
    self.type = None
    self.image=None
    self._up=True
    self.w=10
    self.h=10
    self.x=10
    self.y=10
    self.datas={}
    self.datas["Properties File"]=None

  def Name(self): return self.name

  def getType(self): return self.type

  def addSystem(self, sub):
    self.subSystems.append(sub)  

  def setPosAndSize(self, x, y, w, h):
    self.x=x
    self.y=y
    self.w=w
    self.h=h
    
  def getSystems(self): return self.subSystems  

  def getPosAndSize(self):
    return (self.x, self.y, self.w, self.h)
      
class Frame(systemBase):
  """Frame class: backbone""" 
  def __init__(self, _name = "FRAME"): 
     systemBase.__init__(self, _name)
     self.type = "Frame"     
      
class Suspension(systemBase):
  """Suspension class"""
  def __init__(self, _name="Suspension"):
     systemBase.__init__(self, _name)
     self.type="Suspension"

class Vehicle(systemBase): 
  """Vehicle Class:  No Corresponding Image"""
  def __init__(self,  _name="Vehicle"):
     systemBase.__init__(self, _name)
     self.type="Vehicle"


            
############################################################
class roundRectShape(ogl.RectangleShape):
    """Rectangle class"""
    def __init__(self, obj,  w=0.0, h=0.0):
       ogl.RectangleShape.__init__(self, w, h)
       #self.SetCornerRadius(-.3)
       self.obj = obj
     
    def getPyObj(self): return self.obj 

############################################################
class vEvtHandler(ogl.ShapeEvtHandler):
    def __init__(self):
        ogl.ShapeEvtHandler.__init__(self)
        
    def OnLeftClick(self, x, y, keys=0, attachment=0):
        shape = self.GetShape()
        canvas = shape.GetCanvas()
        dc = wx.ClientDC(canvas)
        canvas.PrepareDC(dc)
        #wx.LogMessage("%s is selected"%shape.__class__.__name__)
        
        if shape.Selected():
            shape.Select(False, dc)
        else:
             toUnselect=[]
             shapeList = canvas.GetDiagram().GetShapeList()
             for s  in shapeList:
                 if s.Selected(): toUnselect.append(s)
             shape.Select(True, dc)
             if len(toUnselect) > 0:
                for s  in toUnselect: s.Select(False, dc)
        canvas.Redraw(dc)
                
    def OnEndDragLeft(self, x, y, keys=0, attachment=0):
        shape = self.GetShape()
        ogl.ShapeEvtHandler.OnEndDragLeft(self, x, y, keys, attachment)

        if not shape.Selected():
            self.OnLeftClick(x, y, keys, attachment)

    def OnSizingEndDragLeft(self, pt, x, y, keys, attch):
        ogl.ShapeEvtHandler.OnSizingEndDragLeft(self, pt, x, y, keys, attch)

    def OnMovePost(self, dc, x, y, oldX, oldY, display):
        ogl.ShapeEvtHandler.OnMovePost(self, dc, x, y, oldX, oldY, display)

    def OnRightClick(self, *dontcare):
        shape = self.GetShape()
        obj = shape.getPyObj()
        type = obj.getType()
        wx.LogMessage("%s is clicked"%type)


              
                    
#############################################################
    
class vsignCanvas(ogl.ShapeCanvas):
     """Canvas for diagram""" 
     def __init__(self,  parent,  vmodel=None, pos=(0, 0), size=(700,700)):
        ogl.ShapeCanvas.__init__(self, parent)
        self.diagram = ogl.Diagram()
        self.SetDiagram(self.diagram)
        self.diagram.SetCanvas(self)
        self.model = vmodel
        self.shapes=[]
        self.lines=[]
        self.updateSize()
     
     def w(self):  return self.width-2
     def h(self):  return self.height-2 
  
     def setModel(self, model):
        self.model = model
        
     def transformation(self, x, y):
          self.updateSize()
          x = x+1+self.width/2
          y = (1+self.height/2)-y
          return (x,y)
          
     def updateSize(self):
        self.width, self.height = self.GetSize()
        
     def AddShapeObj(self, shape, x, y):
        shape.SetDraggable(True, True)
        shape.SetCanvas(self)
        shape.SetX(x)
        shape.SetY(y)
        self.diagram.AddShape(shape)
        shape.Show(True)
        text = "%s:%s"%(shape.getPyObj().getType(), shape.getPyObj().Name())
        shape.AddText(text)
        
        evth = vEvtHandler()
        evth.SetShape(shape)
        evth.SetPreviousHandler(shape.GetEventHandler())
        shape.SetEventHandler(evth)
        self.shapes.append(shape)
        return shape

     def draw(self):
        if self.model == None: return     
        dc = wx.ClientDC(self)  
        self.PrepareDC(dc)
        for obj in  self.model.getSystems():
          x, y, w, h = obj.getPosAndSize()     
          self.AddShapeObj(roundRectShape(obj, w, h), x, y)
        for i in range(1,5):  
          line = ogl.LineShape()
          line.SetCanvas(self)
          line.SetPen(wx.BLACK_PEN)
          line.SetBrush(wx.BLACK_BRUSH)
          line.AddArrow(ogl.ARROW_ARROW)
          line.MakeLineControlPoints(3)
          evth = vEvtHandler()
          evth.SetShape(line)
          evth.SetPreviousHandler(line.GetEventHandler())
          line.SetEventHandler(evth)
          self.shapes[0].AddLine(line, self.shapes[i])
          self.diagram.AddShape(line)
          line.Show(True)
          self.lines.append(line)

        self.Redraw(dc)  

     def reSize(self, ratio=1.0, dx=0, dy=0):   
        dc = wx.ClientDC(self)  
        dc.Clear()
        for shape in self.shapes:     
          x = shape.GetX()      
          y = shape.GetY()      
          x = self.width/2 + (x-self.width/2)*ratio +dx
          y = self.height/2 + (y-self.height/2)*ratio+dy
          w = shape.GetWidth()*ratio
          h = shape.GetHeight()*ratio
          shape.getPyObj().setPosAndSize(x, y, w, h)
          shape.SetX(x)      
          shape.SetY(y)      
          shape.SetWidth(ratio*shape.GetWidth())      
          shape.SetHeight(ratio*shape.GetHeight())      
        for line in self.lines:  
          line.OnMoveLink(dc)      

        self.PrepareDC(dc)
        self.Redraw(dc)  
     

############################################

class cmdPanel(wx.Panel):
     def __init__(self, parent, canvas):   
        wx.Panel.__init__(self, parent, -1)      
        self.canvas = canvas
        boxSizer = wx.BoxSizer(wx.VERTICAL)
        self.btnId=[]
        #bmnt
        boxSizer.Add(wx.StaticText(self, -1, "bmnt", (-1, -1), (-1, -1), wx.ALIGN_CENTER), 1, wx.EXPAND|wx.ALIGN_TOP) 
       # element buttons
        #eleBtnSizer = rcs.RowColSizer()
        btnNames = [["RB", "EB", "PB"], ["B3", "B6", "B9"], ["S3", "S6", "S9"], ["M3", "M6", "M9"],
                    ["SC", "", "MC"], ["SM", "TM", "MM"], ["GI", "FI", "PI"]]    
       # 
        for i in range(7):
         box = wx.BoxSizer(wx.HORIZONTAL)       
         for j in range(3):      
           b = wx.Button(self, wx.NewId(), btnNames[i][j])       
           self.Bind(wx.EVT_BUTTON, self.OnClick, b)
           box.Add(b, 1, wx.EXPAND|wx.ALIGN_LEFT|wx.ALIGN_RIGHT)
         boxSizer.Add(box, 1, wx.EXPAND)   

        btnNames= ["Fast SCON", "Slow SCON"]
        for _name in btnNames:
          b = wx.Button(self, wx.NewId(), _name)      
          self.Bind(wx.EVT_BUTTON, self.OnClick, b)
          boxSizer.Add(b, 0, wx.EXPAND)   

        btnNames= [["GCON", "FCON"], ["ECON", "RCON"]]  
        for i in range(2):
          box = wx.BoxSizer(wx.HORIZONTAL)       
          for j in range(2):
           b = wx.Button(self, wx.NewId(), btnNames[i][j])       
           self.Bind(wx.EVT_BUTTON, self.OnClick, b)
           box.Add(b, 1, wx.EXPAND|wx.ALIGN_LEFT|wx.ALIGN_RIGHT)
          boxSizer.Add(box, 1, wx.EXPAND)   

        btnNames= ["Move Geometry", "Reparenting", "Symmetry On", "Symmetry Off", "Symm Comp"]
        for _name in btnNames:
          b = wx.Button(self, wx.NewId(), _name)      
          self.Bind(wx.EVT_BUTTON, self.OnClick, b)
          boxSizer.Add(b, 0, wx.EXPAND)

        btnNames= [["Copy", "Select"], ["Delate", "Int"]]  
        for i in range(2):
          box = wx.BoxSizer(wx.HORIZONTAL)       
          for j in range(2):
             b = wx.Button(self, wx.NewId(), btnNames[i][j])       
             self.Bind(wx.EVT_BUTTON, self.OnClick, b)
             box.Add(b, 1, wx.EXPAND|wx.ALIGN_LEFT|wx.ALIGN_RIGHT)
          boxSizer.Add(box, 1, wx.EXPAND)   

        box= wx.BoxSizer(wx.HORIZONTAL)
        btnNames= ["Grid", "RV", "VV"]  
        for i in range(3):
          b = wx.Button(self, wx.NewId(), btnNames[i])       
          self.Bind(wx.EVT_BUTTON, self.OnClick, b)
          box.Add(b, 1, wx.EXPAND|wx.ALIGN_LEFT|wx.ALIGN_RIGHT)
        boxSizer.Add(box, 1, wx.EXPAND)   

        btnNames= [["Zoom in", "Zoom out"], ["Move left ", "Move Right"]]  
        for i in range(2):
          box = wx.BoxSizer(wx.HORIZONTAL)       
          for j in range(2):
           id = wx.NewId()       
           self.btnId.append(id)
           b = wx.Button(self, id, btnNames[i][j])       
           self.Bind(wx.EVT_BUTTON, self.OnClick, b)
           box.Add(b, 1, wx.EXPAND|wx.ALIGN_LEFT|wx.ALIGN_RIGHT)
          boxSizer.Add(box, 1, wx.EXPAND)   


        self.SetSizer(boxSizer)  
        boxSizer.SetSizeHints(self)

     def OnClick(self, event):
        if event.GetId() == self.btnId[0]:     
           self.canvas.reSize(ratio=1.05)     
        if event.GetId() == self.btnId[1]:     
           self.canvas.reSize(ratio=0.95)     
        if event.GetId() == self.btnId[2]:     
           self.canvas.reSize(dx=-5)     
        if event.GetId() == self.btnId[3]:     
           self.canvas.reSize(dx=5)     

############################################
class modelTree(wx.Panel):
    def __init__(self, parent):    
      wx.Panel.__init__(self, parent, -1, style=wx.WANTS_CHARS)
      self.Bind(wx.EVT_SIZE, self.OnSize)
      self.tree = wx.TreeCtrl(self, wx.NewId(), wx.DefaultPosition, wx.DefaultSize, wx.TR_HAS_BUTTONS)
      self.root = self.tree.AddRoot("MODEL")
      self.tree.SetPyData(self.root, None)
      self.createTree()

    def createTree(self):
      model = self.GetParent().GetParent().GetParent().getModel()      
      if model == None: return
      self.tree.DeleteChildren(self.root)
      self.car = self.tree.AppendItem(self.root, model.Name())
      self.tree.SetPyData(self.car, model)
      #
      subSys=model.getSystems()
      for sys_ in subSys:
        _name = sys_.Name()      
        child = self.tree.AppendItem(self.car, _name)
        self.tree.SetPyData(child, sys_)
      self.tree.Expand(self.root)  


    def OnSize(self, event):
        w,h = self.GetClientSizeTuple()
        self.tree.SetDimensions(0, 0, w, h)

#######################
class MyLog(wx.PyLog):
    def __init__(self, textCtrl, logTime=0):
        wx.PyLog.__init__(self)
        self.tc = textCtrl
        self.logTime = logTime

    def DoLogString(self, message, timeStamp):
        if self.tc:
            self.tc.AppendText(message + '\n')
###########################################
class vSignWin(wx.Frame):
     def __init__(self, parent,  id, title):
        wx.Frame.__init__(self, parent, id, title, pos=(5, 5), size=(1000, 700) )  
        self.split = wx.SplitterWindow(self, -1, style = wx.SP_3D)
        self.model = Vehicle("Car")
        self.menuBar = wx.MenuBar()
        file_menu = wx.Menu()
        file_menu.Append(wx.ID_NEW,       "&New Model", "Create a new model.")
        file_menu.Append(wx.ID_OPEN,      "&Open",      "Load a existing model.")
        file_menu.Append(wx.ID_SAVE,      "&Save",      "Save current Model.")
        file_menu.Append(wx.ID_SAVEAS,    "&Save As",   "Save model as different file")
        file_menu.Append(wx.ID_CLOSE,     "&Close",     "Delete the model")
        file_menu.Append(wx.ID_EXIT,      "&Quit",      "Quit then application")
        self.menuBar.Append(file_menu, "&File")

        tool_menu = wx.Menu()
        ids_=[]
        for i in range(2):
          ids_.append(wx.NewId())       
        tool_menu.Append(ids_[0], "Create", "Creation")
        tool_menu.Append(ids_[1], "Modify", "Change")
        self.menuBar.Append(tool_menu, "&Model")

        self.SetMenuBar(self.menuBar)
        self.Bind(wx.EVT_MENU, self.doExit,      id=wx.ID_EXIT)
        self.Bind(wx.EVT_MENU, self.doClose,     id=wx.ID_CLOSE)
        self.Bind(wx.EVT_MENU, self.doOpen,      id=wx.ID_OPEN)
        self.Bind(wx.EVT_MENU, self.doNewModel,  id=wx.ID_NEW)
        self.Bind(wx.EVT_MENU, self.doSave,      id=wx.ID_SAVE)
        self.Bind(wx.EVT_MENU, self.doSaveAs,    id=wx.ID_SAVEAS)
        self.Bind(wx.EVT_MENU, self.doNewModel,  id=ids_[0])
        self.Bind(wx.EVT_MENU, self.doModify,    id=ids_[1])
        ogl.OGLInitialize()

        self.split1 = wx.SplitterWindow(self.split, -1, style = wx.SP_3D)
        self.tree = modelTree(self.split1)
        self.canvas = vsignCanvas(self.split1, self.model)
        self.canvas.SetBackgroundColour("white")
        self.split1.SplitVertically(self.tree, self.canvas, 60)
        self.split1.SetMinimumPaneSize(1)

        self.split2 = wx.SplitterWindow(self.split, -1, style = wx.SP_3D)
        p2 = cmdPanel(self.split2, self.canvas)
        self.log = wx.TextCtrl(self.split2,  -1, style = wx.TE_MULTILINE|wx.TE_READONLY|wx.HSCROLL)
        wx.Log_SetActiveTarget(MyLog(self.log))
        self.split2.SplitHorizontally(p2, self.log, -160)

        self.split.SplitVertically(self.split1, self.split2, -150)
        self.split.Show()
        self.split.SetMinimumPaneSize(1)
        self.compMap={}
     
     def getModel(self): return self.model

     def doNewModel(self, event):   
        ##create model -- begin
        w, h = self.canvas.GetClientSize()
        self.createModel(w, h)
        wx.LogMessage("Model %s Created"%self.model.Name())

     def createModel(self, w, h):   
        #_name = "Frame"
        #sys_=Frame("Frame")
        #sys_.setPosAndSize(0, 0, w-20, h/5)
        #self.compMap[_name]=sys_
        #self.model.addSystem(sys_)

        _names = ["Frame", "Front_Left", "Front_Right", "Back_Left", "Back_Right"]
        posAndSizes =[ (0, 0, w-20, h/5), (-w/4, -h/4, w/3, h/5),
                        (-w/4, +h/4, w/3, h/5),
                        (+w/4, -h/4, w/3, h/5),
                        (+w/4, +h/4, w/3, h/5)]
        namePos=zip(_names, posAndSizes)
        for i in namePos:
          sys_ =Suspension(i[0])
          #print sys_.Name()
          self.compMap[i[0]]=sys_
          self.model.addSystem(sys_)
          x=i[1][0]
          y=i[1][1]
          (x, y) = self.canvas.transformation(x, y)
          sys_.setPosAndSize(x, y, i[1][2], i[1][3])
        ##create model -- end 
        self.canvas.setModel(self.model)
        self.canvas.draw() 
        self.tree.createTree()

             
        
     def doExit(self, event):
        pass    
     def doClose(self, event):
        pass    
     def doOpen(self, event):
        pass    
     def doSave(self, event):
        pass    
     def doSaveAs(self, event):
        pass    
     def doModify(self, event):
        pass    
         
class vSignApp(wx.App):
       def  OnInit(self):
           self.frame = vSignWin(None, -1, "VSIGN")
           self.frame.Show(True)
           self.SetTopWindow(self.frame)
           return True

def main():
    global _app
    _app = vSignApp()
    _app.MainLoop()
         
if __name__=="__main__": 
   main()      
