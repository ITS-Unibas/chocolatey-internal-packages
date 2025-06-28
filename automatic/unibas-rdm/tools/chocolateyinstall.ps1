$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.17.0.exe'
  checksum      = '789092d9668d3df9f453380894c67cfc738143f59669aeac808df474d8a6c6ab'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
