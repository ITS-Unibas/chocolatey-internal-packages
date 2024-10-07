$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.13.0.exe'
  checksum      = 'd635b1b314a0520b468d51a0a4de7d5f7f1528d630fb4a7b7f9ff7428d42e3a0'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
