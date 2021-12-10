#requires -Version 4.0

configuration Windows_DisableRDPNLA
{
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node localhost
  {
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