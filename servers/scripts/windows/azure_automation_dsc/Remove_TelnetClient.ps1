#requires -Version 4.0 -Modules PSDesiredStateConfiguration
Configuration RemoveTelnetClient
{
  Import-DscResource -ModuleName PSDesiredStateConfiguration
  Node 'localhost'
  {
    WindowsFeature TelnetClient
    {
      Name = 'Telnet-Client'
      Ensure = 'Absent'
    }
  }
}