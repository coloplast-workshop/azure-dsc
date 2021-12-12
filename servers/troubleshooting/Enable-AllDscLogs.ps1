$logName = 'Microsoft-Windows-Dsc/Analytic'
$log = New-Object -TypeName System.Diagnostics.Eventing.Reader.EventLogConfiguration -ArgumentList $logName
$log.IsEnabled = $true
$log.SaveChanges()