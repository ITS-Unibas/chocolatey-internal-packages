$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.9.0.exe'
  checksum      = 'B1EB151D05D6CAA48334162F1299AC793DD8FBBA6628FBC95D7ABF4CF85E62C8'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
