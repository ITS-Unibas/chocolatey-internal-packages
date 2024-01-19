$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.37.0.exe'
  checksum      = 'd70bb2a790f052f1015b4ffa719a30b4b9fa4b8759d5219fd50dfd6366528e44'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
