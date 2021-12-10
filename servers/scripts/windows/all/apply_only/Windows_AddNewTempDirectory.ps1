#requires -Version 4.0

configuration Windows_AddNewTempDirectory
{
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node localhost
  {
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
  }
}