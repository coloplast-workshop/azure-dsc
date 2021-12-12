[DscLocalConfigurationManager()]
Configuration AzureDscLcmConfig
{ 
  param 
  ( 
    [Parameter(Mandatory)]
    [String[]]$ComputerName,  
    [Parameter(Mandatory)]
    [String]$AzureDscServerUrl,
    [Parameter(Mandatory)]
    [String]$AzureDscRegistrationKey,
    [Parameter(Mandatory)]
    [String]$AzureDSCNodeConfigurationName
  )
  Node $ComputerName
  {
    $ConfigurationNames = @($AzureDSCNodeConfigurationName)
    Settings 
    { 
      RefreshFrequencyMins = 30
      ConfigurationModeFrequencyMins = 15
      RefreshMode = 'Pull'
      ConfigurationMode = 'ApplyAndMonitor' 
      AllowModuleOverwrite = $False
      RebootNodeIfNeeded = $False 
      ActionAfterReboot = 'ContinueConfiguration'            
    }
    ConfigurationRepositoryWeb AzureAutomationDSC 
    { 
      ServerUrl = $AzureDscServerUrl
      RegistrationKey = $AzureDscRegistrationKey
      ConfigurationNames = $ConfigurationNames
    }
    ResourceRepositoryWeb AzureAutomationDSC
    {
      ServerUrl = $AzureDscServerUrl
      RegistrationKey = $AzureDscRegistrationKey
    }
    ReportServerWeb AzureAutomationDSC 
    { 
      ServerUrl = $AzureDscServerUrl 
      RegistrationKey = $AzureDscRegistrationKey
    }
  } 
}

$params = @{
  ComputerName                  = @($env:COMPUTERNAME)
  AzureDscServerUrl             = '_your_url_here'
  AzureDscRegistrationKey       = '_your_key_here_'
  AzureDSCNodeConfigurationName = "$env:COMPUTERNAME.localhost"
}
$windirTemp = $env:windir + '\Temp'

Push-Location -Path $windirTemp
AzureDscLcmConfig @params
Set-DscLocalConfigurationManager -Path "$windirTemp\AzureDscLcmConfig" -Verbose
Pop-Location