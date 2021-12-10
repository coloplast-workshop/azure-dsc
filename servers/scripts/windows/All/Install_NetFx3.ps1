#requires -Version 4.0

configuration Install_NetFx3
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
      Ensure               = 'Present'
      Name                 = 'NetFx3'
    }
  }
}