$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.12.0.exe'
  checksum      = '3e9a606005aab1b717d567019c11e0ab0536b0ae351fac9691bd1cf917a3413c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
