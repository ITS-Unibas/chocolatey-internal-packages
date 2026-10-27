$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.16.0.exe'
  checksum      = 'AACEDEDEB9D8D8C47416F4A8B5AAE2F350BD21D4C42B4D53372F234BF6A8880A'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
