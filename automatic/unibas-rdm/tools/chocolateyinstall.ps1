$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.28.0.exe'
  checksum      = 'f0d01aa41d82adfce1c79ebb92bec4fe529d6d671e0d19e0be6c91b9eb3c8d54'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
