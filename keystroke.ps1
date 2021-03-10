echo KeYSSSS
sleep 2
$wshell = New-Object -ComObject wscript.shell;
#$wshell.AppActivate('naamloos - kladblok')
#Sleep 1
#$wshell.SendKeys("^v")
#Sleep 1
#$wshell.SendKeys("^a")
#$wshell.SendKeys("{BS}")

Sleep 1
$wshell.SendKeys("^{ESC}")
Sleep -Milliseconds 400
[System.Windows.Forms.SendKeys]::SendWait("uitvoeren")
Sleep -Milliseconds 200
$wshell.SendKeys("~")
Sleep -Milliseconds 400
[System.Windows.Forms.SendKeys]::SendWait("powershell.exe")
$wshell.SendKeys("~")
Sleep -Milliseconds 400
$wshell.AppActivate('Windows Powershell')
Sleep -Milliseconds 200

[System.Windows.Forms.SendKeys]::SendWait("cd E:\users\bowen\onedrive\linkz\+")
$wshell.SendKeys("~")
Sleep -Milliseconds 200

[System.Windows.Forms.SendKeys]::SendWait('echo " echo off"  > temp.txt')
$wshell.SendKeys("~")
Sleep -Milliseconds 200

$txt = (
'" :a" ',
'" color 0A" ',
'" echo 888888888888888888888888888888888888888888888888888888888888888888888888888" ',
'" ping localhost -n 1 >null" ',
'" color 0E" ',
'" echo 888888888888888888888888888888888888888888888888888888888888888888888888888" ',
'" ping localhost -n 1 >null" ',
'" goto a" '
)
$txt | ForEach-Object {
[System.Windows.Forms.SendKeys]::SendWait("echo ")
[System.Windows.Forms.SendKeys]::SendWait("$_ >> temp.txt")
$wshell.SendKeys("~")
Sleep -Milliseconds 200
}

[System.Windows.Forms.SendKeys]::SendWait("start cmd.exe")
$wshell.SendKeys("~")
Sleep -Milliseconds 200

[System.Windows.Forms.SendKeys]::SendWait("cd E:\users\bowen\onedrive\linkz\+")
$wshell.SendKeys("~")
Sleep -Milliseconds 200

[System.Windows.Forms.SendKeys]::SendWait("type temp.txt > t.bat")
$wshell.SendKeys("~")
Sleep -Milliseconds 200

[System.Windows.Forms.SendKeys]::SendWait("start t.bat")
$wshell.SendKeys("~")
Sleep -Milliseconds 200
