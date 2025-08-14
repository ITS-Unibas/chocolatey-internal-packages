$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.26.0.exe'
  checksum      = 'f8d43fe6f387f0757d560e32caa169055e4e63740addc6382428d01bde51ef93'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
