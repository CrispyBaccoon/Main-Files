If WScript.Arguments.Count = 0 Then
		MsgBox "Add parameter"
		WScript.Quit 1
	End If
Set objArgs = Wscript.Arguments

dim filesys, demofolder, filetxt
Set filesys = CreateObject("Scripting.FileSystemObject")
Set demofolder = filesys.GetFolder(objArgs(0))
Set filetxt = demofolder.CreateTextFile("newfile.txt", True)
filetxt.WriteLine()
filetxt.Close