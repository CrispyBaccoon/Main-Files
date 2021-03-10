$inp = Read-Host "Input"
#if ( $inp = " " ) { $inp = "Input" }


Add-Type -AssemblyName PresentationCore,PresentationFramework
$ButtonType = [System.Windows.MessageBoxButton]::"OKCancel"
$MessageIcon = [System.Windows.MessageBoxImage]::"None"
$MessageBody = "$inp"
$MessageTitle = ""

$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)

exit