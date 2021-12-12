#requires -Version 4.0 -Modules PSDesiredStateConfiguration
Configuration AddTelnetClient
{
  Import-DscResource -ModuleName PSDesiredStateConfiguration
  Node 'localhost'
  {
    WindowsFeature TelnetClient
    {
      Name = 'Telnet-Client'
      Ensure = 'Present'
      IncludeAllSubFeature = $true
    }
  }
}