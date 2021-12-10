#requires -Version 4.0

$username = 'AzAdmin'
$userpassword = '5/T5=~BGuV@Z\Tm6' | ConvertTo-SecureString -asPlainText -Force
[PSCredential]$credential = New-Object -TypeName 'System.Management.Automation.PSCredential' -ArgumentList ($username, $userpassword)

configuration Add_SecondAdmin
{
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]$ComputerName = 'localhost'
  )
  Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
  Node $ComputerName
  {
    User NewUser
    {
      Ensure = 'Present'
      UserName = $username
      Password = $credential
      PasswordNeverExpires = $true
      Description = 'Second Admin'
    }
    Group AddUserToGroup
    {
      Ensure = 'Present'
      GroupName = 'Administrators'
      Members = 'AzAdmin'
      DependsOn = '[User]NewUser'
    }
  }
}