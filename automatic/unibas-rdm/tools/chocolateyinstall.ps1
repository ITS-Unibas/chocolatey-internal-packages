$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.32.0.exe'
  checksum      = '288669376ea39fc305d696f5f400957e8f8a6cca36aa807f12a3b96e5b855a7e'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
