$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.27.0.exe'
  checksum      = 'd4b172153ddc92fde00d2828de795611a89f80b2f39910788c1e53cfe04e90ec'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
