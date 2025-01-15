$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.26.0.exe'
  checksum      = '6755f39b901a163126108d6f127d0315e91dc7b9381fac563349217aa1016b1e'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
