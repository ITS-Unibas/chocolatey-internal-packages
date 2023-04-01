$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.20.0.exe'
  checksum      = '4f35f93d418f14afbc8c604f372c033e0426b2afa6b0986ca5bcfaec62c98c9e'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
