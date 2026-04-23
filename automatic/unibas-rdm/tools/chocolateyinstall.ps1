$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.19.0.exe'
  checksum      = '2A4F33011D3F679C4A7D6E38CC072485E8E81D0A6729D6F15701093AEA64DC75'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
