$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.12.0.exe'
  checksum      = '1d4a1f52364d7366787ed060d43a15615bc04f8c417d34f1f37b1120556d0f91'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
