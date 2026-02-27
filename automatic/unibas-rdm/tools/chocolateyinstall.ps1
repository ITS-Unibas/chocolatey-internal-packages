$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.32.0.exe'
  checksum      = 'efa2b96ff59dfeeae6bba3dbc425220e447c7069f408cb48b4aa9f1ac8b1e850'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
