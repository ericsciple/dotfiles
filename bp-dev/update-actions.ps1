$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

deploy actions -UseExistingDatabases

$stopwatch.Stop()
Write-Host ""
Write-Host ("Time Elapsed {0:hh\:mm\:ss}" -f $stopwatch.Elapsed)  
