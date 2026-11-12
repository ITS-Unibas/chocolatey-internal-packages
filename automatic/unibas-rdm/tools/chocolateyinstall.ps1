$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.18.0.exe'
  checksum      = '06E7C09CA0EDE3561B97A73596F274FC368838172A7C9E5D1D408A9DDA04048C'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
