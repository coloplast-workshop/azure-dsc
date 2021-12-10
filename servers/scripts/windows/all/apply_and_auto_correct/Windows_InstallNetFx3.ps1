#requires -Version 4.0

configuration Windows_InstallNetFx3
{
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node localhost
  {
    WindowsFeature NetFx3
    {
      Ensure               = 'Present'
      Name                 = 'NetFx3'
    }
  }
}