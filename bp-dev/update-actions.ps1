$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

deploy actions.l2 -UseExistingDatabases

$stopwatch.Stop()
Write-Host ""
Write-Host ("Time Elapsed {0:hh\:mm\:ss}" -f $stopwatch.Elapsed)  
