$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.36.0.exe'
  checksum      = '5b5822c6b777307fda5c12c26052892dcfd39e7b363984afd8b32410e33ec358'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
