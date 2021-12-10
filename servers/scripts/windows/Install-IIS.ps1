#requires -Version 4.0

configuration InstallIIS
{
  Node IsWebServer
  {
    WindowsFeature IIS
    {
      Ensure               = 'Present'
      Name                 = 'Web-Server'
      IncludeAllSubFeature = $true
    }
  }
  Node NotWebServer
  {
    WindowsFeature IIS
    {
      Ensure               = 'Absent'
      Name                 = 'Web-Server'
    }
  }
}