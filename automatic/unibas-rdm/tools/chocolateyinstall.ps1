$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.27.0.exe'
  checksum      = 'a0a7b268a9efa556baa3c995e1c2d593688efe739ea27b169ff7f47b717d7194'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
