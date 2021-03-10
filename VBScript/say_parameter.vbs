Set sapi=CreateObject("sapi.spvoice")

If WScript.Arguments.Count = 0 Then
		MsgBox "Add parameter"
		WScript.Quit 1
	End If
Set objArgs = Wscript.Arguments

For Each strArg in objArgs
  sapi.Speak strArg
next  