for ($o = 1; $o -eq 1)
{
$maximum = Read-Host "Enter Maximum: "
if ( $maximum -eq "" ) { $maximum = 6 } 
if ( $maximum -gt 10 ) 
{ 
    Write-Host "Maximum = 10"
    Write-Host "Maximum is set to 10"
    Write-Host "--------------------"
    pause > $null
    $maximum = 10 
}

cls
while($entry -eq "")
{
	Write-Host "+-+-+-+-+"
	Write-Host "-       -"
	Write-Host "+       +"
	Write-Host "-       -"
	Write-Host "+-+-+-+-+"
	Start-Sleep -Milliseconds 200
	cls
	Write-Host "-+-+-+-+-"
	Write-Host "+       +"
	Write-Host "-       -"
	Write-Host "+       +"
	Write-Host "-+-+-+-+-"
	Start-Sleep -Milliseconds 200
	cls
}

$random = Get-Random -Maximum $maximum

for ($i = 1; $i -le 5; $i++ )
{
	Write-Host "+-+-+-+-+"
	Write-Host "-       -"
	Write-Host "+       +"
	Write-Host "-       -"
	Write-Host "+-+-+-+-+"
	Start-Sleep -Milliseconds 100
	cls
	Write-Host "-+-+-+-+-"
	Write-Host "+       +"
	Write-Host "-       -"
	Write-Host "+       +"
	Write-Host "-+-+-+-+-"
	Start-Sleep -Milliseconds 100
	cls
}
	Write-Host "+-+-+-+-+"
	Write-Host "-       -"
	Write-Host "+  $random    +"
	Write-Host "-       -"
	Write-Host "+-+-+-+-+"
cmd /c pause > $null
}