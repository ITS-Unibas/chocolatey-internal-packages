$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.21.0.exe'
  checksum      = '93b25ae519009c6b775192072ec9a96439f42dfb3bdfcd9a7ddb53585ee329d1'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
