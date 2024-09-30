$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.12.0.exe'
  checksum      = '9a5dfa548c90d86bc081245dd8cdb57c6d40f6f60c025e9ad9e35e4b946f9e4c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
