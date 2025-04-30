$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.34.0.exe'
  checksum      = '5026cc8c1c166db9340663811b6700a6c90a7ce13014d839c9c51ec67d3542a0'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
