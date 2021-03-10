param (
    [string]$Process = "",
    [switch]$v = $false,
    [switch]$f = $false
)

function Split-Process() {
$strPros = $Process.ToString()
$script:arrPros = $strPros.Split(", ")
}

if ($Process -eq "") {
[System.Windows.Forms.MessageBox]::Show("Empty paramaters" , "ErrorMessage")
}

Split-Process

function Search-Process() {
$script:getPros = $arrPros | ForEach-Object { 
Get-Process -Name $_
}
}

function View-Process() {
$getPros
}

function Term-Process() {
$arrPros | ForEach-Object {
Stop-Process -Name $_
exit
}
}

function Build-Choix() {
$script:yes = New-Object System.Management.Automation.Host.ChoiceDescription '&Yes', 'Ready for Termination'
$script:abort = New-Object System.Management.Automation.Host.ChoiceDescription '&Abort', 'Abort Mission'
$script:options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $abort)
$script:title = "Confirmation for termination protocol..."
$script:message = "Do you want to terminate: $arrPros ?"
}

function Start-Choix() {
$script:result = $host.ui.PromptForChoice($title, $message, $options, 0)
}

function Check-Choix() {
switch ($result)
{
    0 { Term-Process }
    1 { exit }
    2 { 'HOW?????????????' }
}
}

if ($v) {
Search-Process
View-Process
}

if ($f) {
$Script:result = 0
Check-Choix
}

Build-Choix
Start-Choix
Check-Choix