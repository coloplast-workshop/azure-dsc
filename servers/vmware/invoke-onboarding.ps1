$resourceGroup = 'azure-dsc-rg'
$automationAccount = 'automation-account'
$outputFolderString = $env:SystemDrive + '\DSC'
$params = @{
  ResourceGroupName     = $resourceGroup
  AutomationAccountName = $automationAccount
  ComputerName          = @('localhost')
  OutputFolder          = $outputFolderString
}

if ($null -ne (Get-InstalledModule -Name 'AzureRM' -ErrorAction SilentlyContinue))
{
  Uninstall-Module -Name 'AzureRM' -AllVersions -WarningAction Ignore
}
if (-not (Get-InstalledModule -Name 'Az' -ErrorAction SilentlyContinue))
{
  Install-Module -Name 'Az' -Force -AllowClobber
  Uninstall-AzureRm -WarningAction Ignore
}
Connect-AzAccount
Get-AzAutomationDscOnboardingMetaconfig @params -Force
Start-Service -Name 'WinRM' -ErrorAction SilentlyContinue
Set-DscLocalConfigurationManager -Path ('{0}\\MetaConfigs' -f $outputFolderString)

# Validating node enrollment
#Get-DscLocalConfigurationManager