$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.18.0.exe'
  checksum      = '742ee907486eb3f30e663af584bfb4e6e36ecea61913d115211e9ada2a45621d'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
