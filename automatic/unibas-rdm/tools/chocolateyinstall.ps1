$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.10.0.exe'
  checksum      = '4a73113da976589e711218c115b52676c7d07a174874e3c2d3cde7ba934bd18b'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
