$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.38.0.exe'
  checksum      = 'fccde2dd4a89d6f5600e2b479a263587f241712a1f9a5b5386b0e2f82c826e03'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
