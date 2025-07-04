$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.20.0.exe'
  checksum      = '291d4694edacb6aab250519f8aa82ca9b887414df47f415f7f2858d47bfb469b'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
