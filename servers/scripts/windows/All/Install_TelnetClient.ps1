#requires -Version 4.0

configuration Install_TelnetClient
{
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]$ComputerName = 'localhost'
  )
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node $ComputerName
  {
    $features = @()
    $features += [pscustomobject]@{
      ConfigName = 'TelnetClient'
      Name       = 'Telnet-Client'
      Ensure     = 'Present'
    }
    foreach ($feature in $features) 
    {
      WindowsFeature $feature.ConfigName
      {
        Ensure = $feature.Ensure
        Name = $feature.Name
      }
    }
  }
}