#tag Window
Begin TPWindow winMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1550546943
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "#TPWindow.kUntitled"
   Visible         =   False
   Width           =   600
   Begin PagePanel ppDetails
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   331
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   237
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   20
      Transparent     =   False
      Value           =   1
      Visible         =   True
      Width           =   343
      Begin ccDetails ctlDetails
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFFFF00
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   331
         HelpTag         =   ""
         InitialParent   =   "ppDetails"
         Left            =   237
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   20
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   343
      End
      Begin Label lblNoSelection
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ppDetails"
         Italic          =   False
         Left            =   257
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "No Selection"
         TextAlign       =   1
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   120
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   303
      End
   End
   Begin Listbox lbImages
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   32
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   331
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Images"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   2
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   205
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   BeginSegmented SegmentedControl sgAddDelete
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   18
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacControlStyle =   0
      Scope           =   2
      Segments        =   "+\n\nFalse\r-\n\nFalse"
      SelectionType   =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   356
      Transparent     =   False
      Visible         =   True
      Width           =   44
   End
   Begin PushButton btnGenerate
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Generate"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   480
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   363
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
			Save
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub CheckForIncomplete()
		  for each oImg as Data.Image in oDoc.aroImages
		    if oImg.IsComplete = false then
		      Alert("Incomplete Items", "There are incomplete items in this document. " + _
		      "Incomplete items are not written to the CSS. Please correct any items listed in red.")
		      exit for oImg
		      
		    end
		    
		  next oImg
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GenerateCSS()
		  // Check for and notify the user of incomplete items
		  CheckForIncomplete
		  
		  dim dlgSave as new SaveAsDialog
		  dlgSave.Filter = ftDocs.CSS
		  dlgSave.PromptText = "Select a location to save the CSS."
		  
		  // If saved, set up the document name
		  if fSave <> nil and fSave.Exists then
		    dim arsParts() as String = Split(fSave.Name, ".")
		    if arsParts.Ubound > 0 then
		      dlgSave.SuggestedFileName = arsParts(0) + ".css"
		      
		    end
		    
		  end
		  
		  dim fCSS as FolderItem = dlgSave.ShowModal
		  
		  // Check for user cancel
		  if fCSS = nil then return
		  
		  try
		    dim tos as TextOutputStream = TextOutputStream.Create(fCSS)
		    tos.Write(oDoc.GenerateCSS)
		    tos.Close
		    
		  catch e as IOException
		    Alert("Write Failed", e.Message)
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleAdd()
		  // Create a new image
		  dim oNew as Data.Image = oDoc.NewImage
		  
		  // Load it into the list
		  LoadList
		  
		  // Select it
		  for i as Integer = lbImages.ListCount - 1 downto 0
		    dim oTag as Data.Image = lbImages.RowTag(i)
		    if oTag <> nil and oTag.sName = oNew.sName then
		      lbImages.ListIndex = i
		      exit for i
		      
		    end
		    
		  next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDelete()
		  if lbImages.ListIndex < 0 then return
		  
		  dim oTag as Data.Image = lbImages.RowTag(lbImages.ListIndex)
		  if oTag = nil then return
		  
		  dim md as new MessageDialog
		  md.Message = "Delete " + oTag.sName + "?"
		  md.Explanation = "Are you sure you want to delete " + oTag.sName + "? This action cannot be undone."
		  
		  md.ActionButton.Caption = "Delete"
		  md.CancelButton.Visible = true
		  
		  if md.ShowModalWithin(self) = md.ActionButton then
		    for i as Integer = oDoc.aroImages.Ubound downto 0
		      if oDoc.aroImages(i).sName = oTag.sName then
		        // Remove it from the array to delete it
		        oDoc.aroImages.Remove(i)
		        
		      end
		      
		    next i
		    
		    // Reload the list
		    LoadList
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEnabledState()
		  // Delete enabled if we have a selection
		  sgAddDelete.Items(1).Enabled = (lbImages.ListIndex > -1)
		  
		  // Generate requires an image
		  btnGenerate.Enabled = (lbImages.ListCount > 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadList()
		  // Try to retain selection
		  dim sSelection as String
		  if lbImages.ListIndex > -1 then
		    dim oTag as Data.Image = lbImages.RowTag(lbImages.ListIndex)
		    if oTag <> nil then
		      sSelection = oTag.sName
		      
		    end
		    
		  end
		  
		  lbImages.Enabled = false
		  lbImages.DeleteAllRows
		  
		  for each oImg as Data.Image in oDoc.aroImages
		    lbImages.AddRow(oImg.sName)
		    lbImages.RowTag(lbImages.LastIndex) = oImg
		    
		    // Restore selection
		    if sSelection <> "" and oImg.sName = sSelection then
		      lbImages.ListIndex = lbImages.LastIndex
		      
		    end
		    
		  next oImg
		  
		  lbImages.Enabled = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  // Not saved yet
		  if fSave = nil or fSave.Exists = false then
		    dim dlgSave as new SaveAsDialog
		    dlgSave.Filter = ftDocs.RetinaAssets
		    dlgSave.PromptText = "Select a location to save the document."
		    
		    fSave = dlgSave.ShowModal
		    
		    // Check for user cancel
		    if fSave = nil then return
		    
		  end
		  
		  try
		    dim tos as TextOutputStream = TextOutputStream.Create(fSave)
		    tos.Write(oDoc.ToJSON.ToString)
		    tos.Close
		    
		    me.TitlebarDocument = fSave
		    self.ContentsChanged = false
		    
		  catch e as IOException
		    Alert("Save Failed", e.Message)
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Show()
		  HandleEnabledState
		  
		  // Calling the overridden superclass method.
		  Super.Show()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show(oInput as Data.Document)
		  // Sanity check
		  if oInput = nil then
		    dim ex as new NilObjectException
		    ex.Message = "Document cannot be nil."
		    
		    raise ex
		    return
		    
		  end
		  
		  oDoc = oInput
		  
		  LoadList
		  
		  me.Show
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		fSave As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private moSelection As Data.Image
	#tag EndProperty

	#tag Property, Flags = &h0
		oDoc As Data.Document
	#tag EndProperty


#tag EndWindowCode

#tag Events ctlDetails
	#tag Event
		Sub RequestName(sName as String)
		  // Ensure it's unique
		  for i as Integer = (lbImages.ListCount - 1) downto 0
		    dim oTag as Data.Image = lbImages.RowTag(i)
		    if oTag <> nil and sName = oTag.sName then
		      Beep
		      Alert(sName + " Exists", "Image names must be unique in order to properly write the CSS for HiDPI.")
		      return
		      
		    end
		    
		  next i
		  
		  // Find the selection item
		  for i as Integer = oDoc.aroImages.Ubound downto 0
		    if oDoc.aroImages(i).sName = moSelection.sName then
		      // This is the one to update
		      oDoc.aroImages(i).sName = sName
		      
		    end
		    
		  next i
		  
		  // Update the list display
		  lbImages.Cell(lbImages.ListIndex, 0) = sName
		  
		  // Dirty the document
		  self.ContentsChanged = true
		End Sub
	#tag EndEvent
	#tag Event
		Sub UpdateProperties(oImg as Data.Image)
		  if moSelection = nil then return
		  
		  // Ensure we're working with the same image
		  if moSelection.sName <> oImg.sName then return
		  
		  // Update current selection
		  moSelection = oImg
		  if lbImages.ListIndex > -1 then
		    lbImages.RowTag(lbImages.ListIndex) = moSelection
		    
		  end
		  
		  // Store it into the document
		  for i as Integer = oDoc.aroImages.Ubound downto 0
		    if oDoc.aroImages(i).sName = moSelection.sName then
		      oDoc.aroImages(i) = moSelection
		      exit for i
		      
		    end
		    
		  next i
		  
		  // Valid state may have changed
		  lbImages.Invalidate
		  
		  // Dirty the document
		  self.ContentsChanged = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbImages
	#tag Event
		Sub Change()
		  // Always stop that timer
		  ctlDetails.StopTimer
		  
		  // Loading protection
		  if me.Enabled = false then return
		  
		  if me.ListIndex > -1 then
		    moSelection = me.RowTag(me.ListIndex)
		    
		  else
		    moSelection = nil
		    
		  end
		  
		  // Load selection
		  if moSelection <> nil then
		    ctlDetails.LoadImage(moSelection)
		    ppDetails.Value = 1
		    
		  else
		    // No Selection
		    ppDetails.Value = 0
		    
		  end
		  
		  HandleEnabledState
		  
		  // Always stop that timer
		  ctlDetails.StopTimer
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma unused column
		  #pragma unused x
		  #pragma unused y
		  
		  // Check the item, make it red if it's incomplete
		  if row < me.ListCount then
		    dim oTag as Data.Image = me.RowTag(row)
		    if oTag <> nil and oTag.IsComplete = false then
		      g.ForeColor = &cFF0000
		      
		    end
		    
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events sgAddDelete
	#tag Event
		Sub Action(itemIndex as integer)
		  // Steal focus to cause data save
		  me.SetFocus
		  
		  select case itemIndex
		  case 0
		    HandleAdd
		    ctlDetails.SetFocusName
		    
		  case 1
		    HandleDelete
		    
		    // Set selection to none explicitly to cause the Changed event
		    lbImages.ListIndex = -1
		    lbImages.SetFocus
		    
		    
		  end select
		  
		  HandleEnabledState
		  
		  // Dirty the document
		  self.ContentsChanged = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnGenerate
	#tag Event
		Sub Action()
		  GenerateCSS
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
