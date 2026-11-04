$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.17.0.exe'
  checksum      = 'B1BDCCE9055D7EA38D225A4816D6CA83D614CF3DECAA231C7C13D68020E82E17'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
