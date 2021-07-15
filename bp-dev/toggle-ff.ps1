[CmdletBinding()]
param(
  [Parameter(Mandatory=$True)]
  [string]$FeatureName)

$ErrorActionPreference = 'Stop'

if ((Get-Command 'Get-FeatureFlag' -ErrorAction Ignore))
{
    $feature = Get-FeatureFlag -FeatureName $FeatureName
    Write-Output $feature
    if ($feature.EffectiveState -eq 'Off')
    {
        $newState = 'On'
    }
    else
    {
        $newState = 'Off'
    }

    Set-FeatureFlag -FeatureName $FeatureName -State $newState
    Get-FeatureFlag -FeatureName $FeatureName
}
else
{
    $scriptPath = $MyInvocation.MyCommand.Path
    lr actions -command "$scriptPath -FeatureName $FeatureName"
}
