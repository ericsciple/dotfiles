[CmdletBinding()]
param(
  [Parameter(Mandatory=$True)]
  [string]$FeatureName)

if (Get-Command 'Get-FeatureFlag')
{
    echo hi #lr actions -command "echo hello"
}
else
{
    $scriptPath = $MyInvocation.MyCommand.Path
    lr actions -command "echo your script path is $scriptPath"
}
