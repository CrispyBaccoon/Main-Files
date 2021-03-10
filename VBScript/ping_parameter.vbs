Set sapi=CreateObject("sapi.spvoice")

If WScript.Arguments.Count = 0 Then
		MsgBox "Add parameter"
		WScript.Quit 1
	End If
Set objArgs = Wscript.Arguments
input = (objArgs(0) & "  [" & objArgs(1) & "]")
msgbox ("Pinging " & input)