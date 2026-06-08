$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.8.0.exe'
  checksum      = '630283A902BFC4413306DDDFC4FE0326407DFB1E685A44DA54221C3A3CD49C05'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
