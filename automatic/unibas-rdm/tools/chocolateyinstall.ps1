$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.31.0.exe'
  checksum      = 'c8dfcc81caf70620fffd6a2bf93da767691b8a0dc5970dca13c7bca3ebce7c1e'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
