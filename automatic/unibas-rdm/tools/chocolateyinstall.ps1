$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.12.0.exe'
  checksum      = '3309646C858F9EF40FDE7D24F526C8A43A5D6DA097D1A39A1AA6E80CC05D3DFD'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
