#requires -Version 4.0 -Modules PSDesiredStateConfiguration
Configuration InstallWebServer
{
  Import-DscResource -ModuleName PSDesiredStateConfiguration
  Node 'localhost'
  {
    WindowsFeature 'NETFrameworkCore' {
      Name   = 'NET-Framework-Core'
      Ensure = 'Present'
    }
    WindowsFeature 'ASP35' {
      Ensure = 'Present'
      Name   = 'Web-Asp-Net'
    }
    WindowsFeature 'NetFrameworkFeatures'  {
      Name   = 'NET-Framework-Features'
      Ensure = 'Present'
    }
    WindowsFeature 'IIS' {
      Ensure = 'Present'
      Name   = 'Web-Server'
    }
    WindowsFeature 'WebRequestMonitor' {
      Ensure = 'Present'
      Name   = 'Web-Request-Monitor'
    }
    WindowsFeature 'WebDynCompression' {
      Ensure = 'Present'
      Name   = 'Web-Dyn-Compression'
    }
    WindowsFeature 'ASP' {
      Ensure = 'Present'
      Name   = 'Web-Asp-Net45'
    }
    WindowsFeature 'CGI' {
      Ensure = 'Present'
      Name   = 'Web-CGI'
    }
    WindowsFeature 'WebServerManagementConsole' {
      Name   = 'Web-Mgmt-Console'
      Ensure = 'Present'
    }
    WindowsFeature 'WebServerManagementConsoleCompat' {
      Name   = 'Web-Mgmt-Compat'
      Ensure = 'Present'
    }
    WindowsFeature  'NETHTTPActivation' {
      Name   = 'NET-HTTP-Activation'
      Ensure = 'Present'
    }
    WindowsFeature 'NETNonHTTPActiv'  {
      Name   = 'NET-Non-HTTP-Activ'
      Ensure = 'Present'
    }
    WindowsFeature 'NETWCFHTTPActivation45' {
      Name   = 'NET-WCF-HTTP-Activation45'
      Ensure = 'Present'
    }
    WindowsFeature 'NETWCFTCPActivation45' {
      Name   = 'NET-WCF-TCP-Activation45'
      Ensure = 'Present'
    }
    WindowsFeature 'WebNetExt' {
      Name   = 'Web-Net-Ext'
      Ensure = 'Present'
    }
    WindowsFeature 'WAS' {
      Name   = 'WAS'
      Ensure = 'Present'
    }
    WindowsFeature 'WASProcessModel' {
      Name   = 'WAS-Process-Model'
      Ensure = 'Present'
    }
    WindowsFeature 'WASNETEnvironment' {
      Name   = 'WAS-NET-Environment'
      Ensure = 'Present'
    }
    WindowsFeature 'WASConfigAPIs' {
      Name   = 'WAS-Config-APIs'
      Ensure = 'Present'
    }
  }
}