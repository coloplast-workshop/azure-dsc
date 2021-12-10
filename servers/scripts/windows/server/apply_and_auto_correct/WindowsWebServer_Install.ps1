#requires -Version 4.0

configuration WindowsWebServer_Install
{
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node localhost
  {
    WindowsFeature IIS
    {
      Ensure               = 'Present'
      Name                 = 'Web-Server'
      IncludeAllSubFeature = $true
    }
  }
}