$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.9.0.exe'
  checksum      = 'd226fe0e70237bf37c1a2a7e205388bde76a8097643f803353d9815dcf283d44'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
