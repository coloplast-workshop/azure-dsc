#requires -Version 4.0

configuration WinConfig_WebServer
{
  Node IsIisInstalled
  {
    WindowsFeature IIS
    {
      Ensure               = 'Present'
      Name                 = 'Web-Server'
      IncludeAllSubFeature = $true
    }
  }
  Node IsIisNotInstalled
  {
    WindowsFeature IIS
    {
      Ensure               = 'Absent'
      Name                 = 'Web-Server'
    }
  }
}