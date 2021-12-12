#requires -Version 4.0 -Modules PSDesiredStateConfiguration
Configuration BaseConfigServer
{
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node 'localhost'
  {
    WindowsFeature 'SMB1'
    {
      Ensure               = 'Absent'
      Name                 = 'FS-SMB1'
    }
    WindowsFeature 'TelnetClient'
    {
      Name   = 'Telnet-Client'
      Ensure = 'Present'
    }
    File 'NewDirectory'
    {
      Ensure = 'Present'
      Type = 'Directory'
      DestinationPath = 'C:\Temp'
      Force = $true
    }
    Environment 'EnvVarAddPath'
    {
      Ensure = 'Present'
      Name = 'Path'
      Path = $true
      Value = ';C:\Temp'
      DependsOn = '[File]NewDirectory'
    }
    Registry 'DoNotOpenServerManagerAtLogon' 
    {
      Ensure = 'Present'
      Key = 'HKLM:\SOFTWARE\Microsoft\ServerManager'
      ValueName = 'DoNotOpenServerManagerAtLogon'
      ValueData = 1
      ValueType = 'Dword'
    }
    Registry 'DisableRDPNLA'
    {
      Ensure = 'Present'
      Key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'
      ValueName = 'UserAuthentication'
      ValueData = 0
      ValueType = 'Dword'
    }
  }
}