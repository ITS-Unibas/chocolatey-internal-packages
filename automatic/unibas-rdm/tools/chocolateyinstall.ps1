$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.23.0.exe'
  checksum      = '0d8c69bc4ca67f7b9ad7d72ae983542b68537cf0ef8172d1c6b46ab5160378ab'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
