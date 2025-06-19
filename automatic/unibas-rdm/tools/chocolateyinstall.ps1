$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.16.0.exe'
  checksum      = 'cdc81ac30d8739fa465520edbe40a2b1dad9069207f9712599aa1d8c7eab923f'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
