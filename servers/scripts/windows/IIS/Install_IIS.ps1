#requires -Version 4.0

configuration WinConfigIIS
{
  Node IsIISInstalled
  {
    WindowsFeature IIS
    {
      Ensure               = 'Present'
      Name                 = 'Web-Server'
      IncludeAllSubFeature = $true
    }
  }
  Node IsIISNotInstalled
  {
    WindowsFeature IIS
    {
      Ensure               = 'Absent'
      Name                 = 'Web-Server'
    }
  }
}