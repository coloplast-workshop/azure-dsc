#requires -Version 4.0 
Configuration AddTelnetClient
{
  Import-DscResource -ModuleName PSDesiredStateConfiguration
  Node 'localhost'
  {
    WindowsFeature TelnetClient
    {
      Name = 'TelnetClient'
      Ensure = 'Present'
      IncludeAllSubFeature = $true
    }
  }
}