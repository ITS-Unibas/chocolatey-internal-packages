$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.15.0.exe'
  checksum      = '640aa35f71001666cca2568040d591af02c6c1cdfdfcddf8e4829d014934cf5d'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
