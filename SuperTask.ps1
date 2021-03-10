$totaltime = 10
$prev_alltime = 0
$waittime = $totaltime
echo 0

for ( $PercentComplete = 0; $PercentComplete -lt 100)
{
$pasttime = $waittime
$waittime = ( $pasttime / 2 )
Start-Sleep -s $waittime


$alltime = ( $prev_alltime + $waittime )

$PercentComplete = ( $alltime / $totaltime ) * 100
echo $PercentComplete

$prev_alltime = $alltime

}
cmd /c pause | out-null