#tag Class
Protected Class Image
	#tag Method, Flags = &h0
		Sub Constructor()
		  // New item
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(jsRep as JSONItem)
		  // Create from JSONItem
		  s1x = jsRep.Lookup("s1x", "")
		  s2x = jsRep.Lookup("s2x", "")
		  sCSS = jsRep.Lookup("sCSS", "")
		  sHeight = jsRep.Lookup("sHeight", "")
		  sName = jsRep.Lookup("sName", "")
		  sWidth = jsRep.Lookup("sWidth", "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsComplete() As Boolean
		  dim bComplete as Boolean = true
		  bComplete = bComplete and (s1x <> "")
		  bComplete = bComplete and (s2x <> "")
		  bComplete = bComplete and (sHeight <> "")
		  bComplete = bComplete and (sName <> "")
		  bComplete = bComplete and (sWidth <> "")
		  
		  return bComplete
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToJSON() As JSONItem
		  dim jsRep as new JSONItem
		  jsRep.Value("s1x") = s1x
		  jsRep.Value("s2x") = s2x
		  jsRep.Value("sCSS") = sCSS
		  jsRep.Value("sHeight") = sHeight
		  jsRep.Value("sName") = sName
		  jsRep.Value("sWidth") = sWidth
		  
		  return jsRep
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ValidName(sName as String) As Boolean
		  // Validates the name as a CSS selector
		  // https://pineco.de/css-quick-tip-the-valid-characters-in-a-custom-css-selector/
		  // Returns True if valid enough for our purposes
		  // Returns false if invalid for our purposes
		  
		  // Can't start with 0-9
		  dim vFirst as Variant = sName.Left(1)
		  if vFirst.IsNumeric then return false
		  
		  // Can't start with "--"
		  dim sPrefix as String = sName.Left(2)
		  if sPrefix = "--" then return false
		  
		  // Cant start with "-[0-9]"
		  dim vPrefix as Variant = sPrefix.Right(1)
		  if vPrefix.IsNumeric then return false
		  
		  // Can only contain letters, numbers, hyphens, underscores
		  dim rx as new RegEx
		  rx.SearchPattern = "[^a-zA-Z0-9\-\_]"
		  
		  dim rxm as RegExMatch = rx.Search(sName)
		  
		  // True if no invalid characters were found
		  return (rxm = nil)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		s1x As String
	#tag EndProperty

	#tag Property, Flags = &h0
		s2x As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sCSS As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sHeight As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sWidth As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="s1x"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="s2x"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sCSS"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sHeight"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sWidth"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
