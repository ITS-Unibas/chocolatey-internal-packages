$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.26.0.exe'
  checksum      = '1ac9b37c73995b7e0b5714d20acaaac67ccdf48d00dd8a0c2a70bf51e977fa57'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
