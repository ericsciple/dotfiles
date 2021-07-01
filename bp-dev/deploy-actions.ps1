$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

deploy mps.l2,token.l2,ac.l2,actions.l2

$stopwatch.Stop()
Write-Host ""
Write-Host ("Time Elapsed {0:hh\:mm\:ss}" -f $stopwatch.Elapsed)  
