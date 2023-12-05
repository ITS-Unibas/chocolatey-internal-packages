$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.32.0.exe'
  checksum      = '9d1766c2448c22cc17d99d7fbff94c6ca81a3a894cd605c0bc64626d9c6bfab3'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
