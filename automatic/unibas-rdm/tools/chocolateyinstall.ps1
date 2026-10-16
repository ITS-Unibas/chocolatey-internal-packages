$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.15.0.exe'
  checksum      = '3A3CA353540D1710FA984570379613C3F137BF2B10E2C5F02C277DC8AB4AC6F9'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
