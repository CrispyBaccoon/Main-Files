cd $PSScriptRoot

Add-Type -AssemblyName System.Windows.Forms    
Add-Type -AssemblyName System.Drawing

for ( $i = 1; $i -ge 0; $i++) {

$key = $Host.UI.RawUI.ReadKey()
if ($key.Character -eq 'z') { exit }

if ($key.Character -eq '1') {
    [System.Windows.Forms.MessageBox]::Show("Hello World." , "My Dialog Box")
}

if ($key.Character -eq 'a') {
    $cont = Get-Content .\tect.txt
    .\speak-input.ps1 -string $cont
}

}