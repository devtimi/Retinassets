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
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
