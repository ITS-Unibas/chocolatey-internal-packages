$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.24.0.exe'
  checksum      = 'f74664f020e6d2d7d7d243e38be6544b6ff8dbf04e7f857fa7983f6c991b9250'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
