param ()

Start-Script

function Calc-Bin([int]$i = $args[0]) {}

function Calc-HEX([int]$i = $args[0]) {}

function Get-NumberValues([int]$i = $args[0]) {}

function Show-NumberValues([int]$i = $args[0]) {}


(1..$n) | foreach-object { Show-NumberValues $_ }


Stop-Script