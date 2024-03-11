$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.15.0.exe'
  checksum      = '89b8c36415d2470f846c39e4a61553ab53a9b6d3b7dcf043f74ba4434f3ab18b'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
