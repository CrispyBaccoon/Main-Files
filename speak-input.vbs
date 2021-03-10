Set sapi=CreateObject("sapi.spvoice")

If WScript.Arguments.Count = 0 Then
		MsgBox "Add parameter"
		WScript.Quit 1
	End If

Set objArgs = Wscript.Arguments

ObjStr = objArgs(0)
For I = 1 to ( objArgs.Count - 1 )
  ObjStr = ObjStr & " " & objArgs(I)
Next

sapi.Speak ObjStr