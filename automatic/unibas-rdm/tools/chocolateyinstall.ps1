$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2022.3.35.0.exe'
  checksum      = 'a289080d78eb832e71f6c9e9264be4b8d55f3d2f238cd7b735ca0e18cc23ec65'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
