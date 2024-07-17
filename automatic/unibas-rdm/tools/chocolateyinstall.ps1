$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.16.0.exe'
  checksum      = '4a953bd47b4ffefa23ee7e5b68affa013e952e7d654472277594e20f79120930'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
