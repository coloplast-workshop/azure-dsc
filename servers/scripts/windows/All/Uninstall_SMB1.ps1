#requires -Version 4.0

configuration Uninstall_SMB1
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