$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.31.0.exe'
  checksum      = 'e72a1a7e3a11f6e6d1bd2f1c136f164fef7d339cc02b25b5f92c8666d1baacae'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
