$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.37.0.exe'
  checksum      = '5a75850693027226a9e4d3ddb6f64406a2a9cc3d7afe6d644d2b0fdd4ccfc3d9'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
