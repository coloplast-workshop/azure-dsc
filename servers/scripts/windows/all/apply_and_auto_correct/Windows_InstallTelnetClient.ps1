#requires -Version 4.0

configuration Windows_InstallTelnetClient
{
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node localhost
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