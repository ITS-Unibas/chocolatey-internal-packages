$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.11.0.exe'
  checksum      = 'd50d6870785ac0129707217d11495951a2dee86c4bdac5b1c6e3ce797a35f5a6'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
