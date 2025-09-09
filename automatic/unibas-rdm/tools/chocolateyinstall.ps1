$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.28.0.exe'
  checksum      = '56ad29d444b6601e41ae7e8f35d32ce45eb2124e73c2c7af685b7c887a47d424'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
