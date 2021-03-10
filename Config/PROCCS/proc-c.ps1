cd $PSScriptRoot
$proc = Get-Content -Path .\proc.txt
.\proc-s.ps1 -Process $proc