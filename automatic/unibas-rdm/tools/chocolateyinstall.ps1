$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.25.0.exe'
  checksum      = '67f5281a8ebc1662e61c216f5887115a8b68f56c46fee58a32e24d0ce82eb1b2'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
