$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.26.0.exe'
  checksum      = 'ff6b68622cb151fce6e7afa2d8780a8a626f65a86730c9f68caebc7b6c580b9d'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
