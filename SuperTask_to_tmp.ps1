$totaltime = 10
$prev_alltime = 0
$waittime = $totaltime

$tm = New-TemporaryFile
echo 0 > $tm

for ( $PercentComplete = 0; $PercentComplete -lt 100)
{
$pasttime = $waittime
$waittime = ( $pasttime / 2 )
Start-Sleep -s $waittime


$alltime = ( $prev_alltime + $waittime )

$PercentComplete = ( $alltime / $totaltime ) * 100
echo $PercentComplete >> $tm

$prev_alltime = $alltime

}
start notepad.exe $tm
$null = pause