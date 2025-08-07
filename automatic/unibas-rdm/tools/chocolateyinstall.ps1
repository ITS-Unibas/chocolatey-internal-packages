$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.25.0.exe'
  checksum      = 'a0a08dd09c68fbd85f9087a714a29f564a437a1eb0bda2beed25818fc55d0ed1'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
