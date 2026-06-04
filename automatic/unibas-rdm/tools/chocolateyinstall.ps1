$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.7.0.exe'
  checksum      = 'C3D60F443E4E694B2250C117BE34289AD70F0ED335D7CF49E4B0174A87604186'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
