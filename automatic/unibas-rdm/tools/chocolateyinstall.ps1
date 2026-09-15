$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.5.0.exe'
  checksum      = '88E91F74C0B8E6613DB3A5D2B822E90D2285560D3BC5831531A26281F43BC26A'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
