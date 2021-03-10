$text = "$args[0]"
$title = "$args[1]"
$button = "$args[2]"
$alerttype = "$args[3]"

Add-Type -AssemblyName PresentationCore,PresentationFramework
$ButtonType = [System.Windows.MessageBoxButton]::$button
$MessageIcon = [System.Windows.MessageBoxImage]::$alerttype
$MessageBody = $text
$MessageTitle = $title

$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)

pause > $null