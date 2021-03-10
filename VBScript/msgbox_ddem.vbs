' The following example requires that Option Infer be set to On.

' Define the message you want to see inside the message box.
Set msg = "Do you want to continue?"

' Define a title for the message box.
Set title = "MsgBox Demonstration"

' Now define a style for the message box. In this example, the
' message box will have Yes and No buttons, the default will be
' the No button, and a Critical Message icon will be present.
Sub styler
	Set MsgBoxStyle.YesNo = 4
	Set MsgBoxStyle.DefaultButton2 = 256
	Set MsgBoxStyle.Critical = 16
End Sub styler
Set style = MsgBoxStyle.YesNo & "+" & MsgBoxStyle.DefaultButton2 & "+" & MsgBoxStyle.Critical

' Display the message box and save the response, Yes or No.
Set response = MsgBox(msg, style, title)

' Set response numbers
Set MsgBoxResult.OK = 1
Set MsgBoxResult.Cancel = 2
Set MsgBoxResult.Abort = 3
Set MsgBoxResult.Retry = 4
Set MsgBoxResult.Ignore = 5
Set MsgBoxResult.Yes = 6
Set MsgBoxResult.No = 7
' Take some action based on the response.
If response = MsgBoxResult.Yes Then
    MsgBox("YES", , title)
Else
    MsgBox("NO", , title)
End If