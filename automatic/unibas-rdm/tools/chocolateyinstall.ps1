$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.25.0.exe'
  checksum      = '71afb3daea27d9f56806d5fa82d3ea76a7876eafec3f83ea016b3e603ffd16bd'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
