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
AddTelnetClient -OutputPath "$env:SystemDrive\DSC"
Start-Service -Name 'WinRM' -ErrorAction SilentlyContinue
Start-DscConfiguration -Path "$env:SystemDrive\DSC" -Wait -Force