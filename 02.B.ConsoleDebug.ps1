

Set-PSBreakpoint -Script .\DebuggingScript.ps1  -Line 12

Get-PSBreakpoint | Remove-PSBreakpoint
$dbAction = {$msg ="  variable: {0} {1}" -f $currentFile.LastWriteTime, $currentFile.Name ;Write-Host  $msg -ForegroundColor Green } 
Set-PSBreakpoint -Variable currentFile -Script .\DebuggingScript.ps1 -Action $dbAction -Mode Write

.\DebuggingScript.ps1

Get-PSBreakpoint
Disable-PSBreakpoint -Id 