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
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileNew() As Boolean Handles FileNew.Action
			App.NewDocument
			
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
