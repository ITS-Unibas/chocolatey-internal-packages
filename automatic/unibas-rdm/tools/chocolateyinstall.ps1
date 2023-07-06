$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.14.0.exe'
  checksum      = 'a1c189e8228e3329d0819acebad5017b6f35884a1ed358a8e161b0b4cb60db8c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
