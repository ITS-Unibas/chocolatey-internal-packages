$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.22.0.exe'
  checksum      = '46fb0afbdd62e4b27b1fd1334a279be6248f74ed31cd83f575026137fa83ad66'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
