$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.24.0.exe'
  checksum      = '133a6173045cbc4d2ce1442affab319f102c8b4f634f6c7a6e4a2285f248ab74'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
