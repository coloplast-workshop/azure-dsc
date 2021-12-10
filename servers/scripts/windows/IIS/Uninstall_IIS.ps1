#requires -Version 4.0

configuration Uninstall_IIS
{
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]$ComputerName = 'localhost'
  )
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node $ComputerName
  {
    WindowsFeature IIS
    {
      Ensure = 'Absent'
      Name   = 'Web-Server'
    }
  }
}