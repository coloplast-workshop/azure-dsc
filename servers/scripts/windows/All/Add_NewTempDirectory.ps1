#requires -Version 4.0

configuration Add_NewTempDirectory
{
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]$ComputerName = 'localhost'
  )
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node $ComputerName
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