$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.10.0.exe'
  checksum      = 'd0e8833ee46589ffd74a6e7fa3cb951c737ea3adb3dcdfab8d5bf35f580b97df'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
