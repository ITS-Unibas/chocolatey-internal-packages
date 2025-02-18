$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.29.0.exe'
  checksum      = '86635f87d67eeda3c319853ee5370bb97aa6b496856bdbb0bd2cade9b329f111'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
