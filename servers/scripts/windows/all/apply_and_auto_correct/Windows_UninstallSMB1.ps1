#requires -Version 4.0

configuration Windows_UninstallSMB1
{
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node localhost
  {
    $features = @()
    $features += [pscustomobject]@{
      ConfigName = 'FSSMB1'
      Name       = 'FS-SMB1'
      Ensure     = 'Absent'
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