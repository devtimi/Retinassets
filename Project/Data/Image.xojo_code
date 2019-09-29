#tag Class
Protected Class Image
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
