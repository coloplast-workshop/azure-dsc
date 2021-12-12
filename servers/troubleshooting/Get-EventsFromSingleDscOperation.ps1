& "$env:windir\system32\wevtutil.exe" set-log 'Microsoft-Windows-Dsc/Analytic' /q:true /e:true
& "$env:windir\system32\wevtutil.exe" set-log 'Microsoft-Windows-Dsc/Debug' /q:True /e:true

Get-DscLocalConfigurationManager

$dscEvents = [Array](Get-WinEvent -LogName 'Microsoft-Windows-Dsc/Operational') + [Array](Get-WinEvent -LogName 'Microsoft-Windows-Dsc/Analytic' -Oldest) + [Array](Get-WinEvent -LogName 'Microsoft-Windows-Dsc/Debug' -Oldest)
$separateDscOperations = $dscEvents | Group-Object -Property {
  $_.Properties[0].value
}

#Operations failures
$separateDscOperations | Where-Object -FilterScript {
  $_.Group.LevelDisplayName -contains 'Error'
}

#Details of operations run in the last half hour
$dateLatest = (Get-Date).AddMinutes(-30)
$separateDscOperations | Where-Object -FilterScript {
  $_.Group.TimeCreated -gt $dateLatest
}