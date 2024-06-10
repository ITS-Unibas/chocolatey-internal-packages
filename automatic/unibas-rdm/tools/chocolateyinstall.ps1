$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.32.0.exe'
  checksum      = 'eb53a725323310f7a462db15677cd070bc0d8ffac3ed189811792a24f8a4a504'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
