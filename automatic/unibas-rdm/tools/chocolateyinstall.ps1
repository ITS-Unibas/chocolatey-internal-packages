$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.19.0.exe'
  checksum      = '5c51d15fcdba348168b96e08c780b221634d509889d3bf85856c66b4e4aff753'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
