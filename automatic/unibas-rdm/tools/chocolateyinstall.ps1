$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.24.0.exe'
  checksum      = 'deb4a0d06b7d89b01d52c56b976547ebb877fc862aab71f5d9912e11e12a91c5'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
