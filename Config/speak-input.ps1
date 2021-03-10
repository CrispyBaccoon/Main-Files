param (
    [string[]]$string = "",
    [switch]$box = $false
    )

start .\speak-input.vbs $string

if ($box) {
[System.Windows.Forms.MessageBox]::Show("Hello World." , "My Dialog Box")
}