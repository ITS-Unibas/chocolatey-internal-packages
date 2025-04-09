$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.30.0.exe'
  checksum      = '5afe93ec94831e3f7e2e9fa634a842ff4056c6d535ad808572ad111d36cd6062'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
