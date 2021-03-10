Add-Type -AssemblyName PresentationCore,PresentationFramework 										
$ButtonType = [System.Windows.MessageBoxButton]::OKCancel 											
$MessageIcon = [System.Windows.MessageBoxImage]::information 										
$MessageBody = "Something went wrong..." 																			
$MessageTitle = "Unexpected Error" 																			
$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)   
