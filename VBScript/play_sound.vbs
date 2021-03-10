Dim oPlayer
Set oPlayer = CreateObject("WMPlayer.OCX")

' Play audio
oPlayer.URL = "E://users/bowen/onedrive/linkz/+/GLaDOS/GLaDOS-surprise.mp3"
' oPlayer.openPlayer "E://users/bowen/onedrive/linkz/+/GLaDOS/GLaDOS-surprise.mp3"
oPlayer.controls.play 
While oPlayer.playState <> 1 ' 1 = Stopped
  WScript.Sleep 100
Wend

' Release the audio file
oPlayer.close