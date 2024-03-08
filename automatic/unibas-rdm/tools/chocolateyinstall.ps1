$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.14.0.exe'
  checksum      = '4e9b4badcba34d3f7994dbab8bb9893ef1eda3986e8a2768616447fa0a8cf537'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
