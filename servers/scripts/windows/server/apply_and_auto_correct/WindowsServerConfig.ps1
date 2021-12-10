#requires -Version 4.0

configuration WindowsServerConfig
{
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node localhost
  {
    WindowsFeature NetFx3
    {
      Ensure               = 'Present'
      Name                 = 'NetFx3'
    }
    WindowsFeature SMB1
    {
      Ensure               = 'Absent'
      Name                 = 'FS-SMB1'
    }
    File NewDirectory
    {
      Ensure = 'Present'
      Type = 'Directory'
      DestinationPath = 'C:\Temp'
      Force = $true
    }
    Environment EnvVarAddPath
    {
      Ensure = 'Present'
      Name = 'Path'
      Path = $true
      Value = ';C:\Temp'
      DependsOn = '[File]NewDirectory'
    }
    Registry DoNotOpenServerManagerAtLogon {
      Ensure = 'Present'
      Key = 'HKLM:\SOFTWARE\Microsoft\ServerManager'
      ValueName = 'DoNotOpenServerManagerAtLogon'
      ValueData = 1
      DependsOn = '[Registry]NoAutoUpdate'
    }
    Registry DisableRDPNLA
    {
      Key = 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'
      ValueName = 'UserAuthentication'
      ValueData = 0
      ValueType = 'Dword'
      Ensure = 'Present'
    }
  }
}