#tag Class
Protected Class Document
	#tag Method, Flags = &h0
		Function FindUniqueImageName(sBase as String) As String
		  // First check to see if the base is available
		  for each oImg as Data.Image in me.aroImages
		    if oImg.sName = sBase then
		      // It is not, try to construct a unique name
		      dim iCount as Integer = 1
		      while true
		        dim sTest as String = sBase + str(iCount)
		        
		        // Loop through all the images again with the new test name
		        dim bFound as Boolean
		        for each oImgInner as Data.Image in me.aroImages
		          bFound = bFound or (oImgInner.sName = sTest)
		          if bFound = true then exit for oImgInner
		          
		        next oImgInner
		        
		        // Did we find the new test name in the list?
		        if bFound = false then
		          // Unique name!
		          return sTest
		          
		        else
		          // Increment count
		          iCount = iCount + 1
		          
		        end
		        
		        // Don't loop forever, make up something *probably* unique
		        if iCount > 999 then
		          return Uppercase(EncodeHex(MD5(str(Microseconds, "#"))))
		          
		        end
		        
		      wend
		      
		    end
		    
		  next oImg
		  
		  // Base was available!
		  return sBase
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FromJSON(jsRep as JSONItem)
		  // Read a JSONItem into a document
		  dim jsImages as JSONItem = jsRep.Lookup("Images", nil)
		  if jsImages = nil then return
		  
		  dim iMax as Integer = jsImages.Count - 1
		  if iMax < 0 then return
		  
		  for i as Integer = 0 to iMax
		    dim jsThisImage as JSONItem = jsImages.Value(i)
		    if jsThisImage <> nil then
		      dim oImg as new Data.Image(jsThisImage)
		      aroImages.Append(oImg)
		      
		    end
		    
		  next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateCSS() As String
		  dim ars1XCSS() as String
		  dim ars2XCSS() as String
		  
		  for each oImg as Data.Image in aroImages
		    // 1x CSS
		    ars1XCSS.Append("#" + oImg.sName + " {")
		    ars1XCSS.Append(kTab + "background: url('" + oImg.s1x + "') no-repeat;")
		    ars1XCSS.Append(kTab + "height: " + oImg.sHeight + "px;")
		    ars1XCSS.Append(kTab + "width: " + oImg.sWidth + "px;")
		    ars1XCSS.Append("}" + EndOfLine)
		    
		    // 2x CSS
		    ars2XCSS.Append("#" + oImg.sName + " {")
		    ars2XCSS.Append(kTab + "background: url('" + oImg.s2x + "') no-repeat;")
		    ars2XCSS.Append(kTab + "background-size: contain;")
		    ars2XCSS.Append("}" + EndOfLine)
		    
		  next oImg
		  
		  dim arsData() as String
		  arsData.Append("/* Images */")
		  
		  // Copy in 1x CSS
		  for i as Integer = 0 to ars1XCSS.Ubound
		    arsData.Append(ars1XCSS(i))
		    
		  next i
		  
		  // HiDPI Media Query
		  arsData.Append("/* High Resolution Images */")
		  arsData.Append("@media" + kTab + "only screen and (-webkit-min-device-pixel-ratio:1.3),")
		  arsData.Append(kTab + kTab + "only screen and (-o-min-device-pixel-ratio:13 / 10),")
		  arsData.Append(kTab + kTab + "only screen and (min-resolution:120dpi) {")
		  
		  // Now the 2x CSS
		  for i as Integer = 0 to ars2XCSS.Ubound
		    arsData.Append(kTab + ars2XCSS(i))
		    
		  next i
		  
		  // End HiDPI Media Query
		  arsData.Append("}")
		  
		  // Join it into one string
		  return Join(arsData, EndOfLine)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewImage() As Data.Image
		  // Create the image
		  dim oNew as new Data.Image
		  oNew.sName = FindUniqueImageName("Untitled")
		  
		  // Store it in the document
		  aroImages.Append(oNew)
		  
		  // Pass it back
		  return oNew
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToJSON() As JSONItem
		  dim jsRep as new JSONItem
		  
		  dim jsImages as new JSONItem
		  for each oImg as Data.Image in aroImages
		    jsImages.Append(oImg.ToJSON)
		    
		  next oImg
		  
		  jsRep.Value("Images") = jsImages
		  
		  return jsRep
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		aroImages() As Data.Image
	#tag EndProperty


	#tag Constant, Name = kTab, Type = String, Dynamic = False, Default = \"\t", Scope = Private
	#tag EndConstant


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
	#tag EndViewBehavior
End Class
#tag EndClass
