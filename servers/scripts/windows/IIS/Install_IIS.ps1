#requires -Version 4.0

configuration Install_IIS
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
      Ensure               = 'Present'
      Name                 = 'Web-Server'
      IncludeAllSubFeature = $true
    }
  }
}