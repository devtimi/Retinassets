#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  dim o as new Data.Document
		  dim w as new winMain
		  w.Show(o)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  App.AutoQuit = True
		  
		  #if TargetMacOS then
		    FileQuitSeparator.Close
		    
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  // Sanity check
		  if item = nil or item.Exists = false then
		    NewDocument
		    return
		    
		  end
		  
		  dim sContents as String
		  
		  try
		    dim tis as TextInputStream = TextInputStream.Open(item)
		    tis.Encoding = Encodings.UTF8
		    sContents = tis.ReadAll
		    tis.Close
		    
		  catch e as IOException
		    MsgBox("Document Error" + EndOfLine + EndOfLine + _
		    "Could not open document. " + e.Message)
		    return
		    
		  end try
		  
		  // Check if empty
		  if sContents = "" then
		    NewDocument
		    return
		    
		  end
		  
		  try
		    dim jsDoc as new JSONItem(sContents)
		    
		    dim oDoc as new Data.Document
		    oDoc.FromJSON(jsDoc)
		    
		    dim oWin as new winMain
		    oWin.fSave = item
		    oWin.TitlebarDocument = item
		    oWin.Show(oDoc)
		    
		  catch e as JSONException
		    // Bad JSON
		    MsgBox("Document Error" + EndOfLine + EndOfLine + _
		    "Could not read document. " + e.Message)
		    
		  end try
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileNew() As Boolean Handles FileNew.Action
			App.NewDocument
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			dim f as FolderItem = GetOpenFolderItem(ftDocs.RetinaAssets)
			if f <> nil and f.Exists = true then
			OpenDocument(f)
			
			end
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kMonospacedFont, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Menlo"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Courier New"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
