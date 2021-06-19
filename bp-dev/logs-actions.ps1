[CmdletBinding()]
param(
  [string]$Since = '15m'
)

$ErrorActionPreference = 'Stop'
$kubectlOutput = & kubectl get all
$actionsApiServer = @(
    $kubectlOutput |
    ForEach-Object {
        if ($_ -match '^(pod/actions-api-server-[^\s]+).+Running')
        {
            $matches[1]
        }
    } |
    Where-Object {
        $_ -ne ''
    }
)
$actionsJobAgent = @(
    $kubectlOutput |
    ForEach-Object {
        if ($_ -match '^(pod/actions-job-agent-[^\s]+).+Running')
        {
            $matches[1]
        }
    } |
    Where-Object {
        $_ -ne ''
    }
)
if ($actionsApiServer.Count -ne 1)
{
    throw "Expected exactly one running actions-api-server pod; found $($actionsApiServer.Count)"
}
if ($actionsJobAgent.Count -ne 1)
{
    throw "Expected exactly one running actions-job-agent pod; found $($actionsJobAgent.Count)"
}
kubectl logs "--since=$Since" "$($actionsApiServer[0])"
kubectl logs "--since=$Since" "$($actionsJobAgent[0])"
