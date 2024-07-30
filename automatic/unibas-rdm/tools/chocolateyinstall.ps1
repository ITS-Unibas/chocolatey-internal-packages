$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.17.0.exe'
  checksum      = '65c991bb9cf26e7b725f1280162a19bde464d63cc2c1045d87ec17f21c949fce'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
