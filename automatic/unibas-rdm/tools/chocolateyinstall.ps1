$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.18.0.exe'
  checksum      = '44bfb71f9a9bb5535f3eb6d415b043b2d8356bdc194f13611e5372883229855b'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
