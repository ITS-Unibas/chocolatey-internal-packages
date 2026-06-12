$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.9.0.exe'
  checksum      = '44AE4DFC605F7BD2289B45BA95F932F36F19F05B0AE614358DDAEC9B3256BE3C'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
