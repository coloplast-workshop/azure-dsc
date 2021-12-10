#requires -Version 4.0

configuration WinConfig
{
  Node IsNetFx3Installed
  {
    WindowsFeature NetFx3
    {
      Ensure               = 'Present'
      Name                 = 'NetFx3'
    }
  }
  Node IsNetFx3NotInstalled
  {
    WindowsFeature NetFx3
    {
      Ensure               = 'Absent'
      Name                 = 'NetFx3'
    }
  }
}