#requires -Version 4.0

configuration Uninstall_NetFx3
{
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]$ComputerName = 'localhost'
  )
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node $ComputerName
  {
    WindowsFeature NetFx3
    {
      Ensure               = 'Absent'
      Name                 = 'NetFx3'
    }
  }
}