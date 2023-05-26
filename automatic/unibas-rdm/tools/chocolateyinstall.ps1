$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.28.0.exe'
  checksum      = '48c59da9e05e7a532e3828ce7239f1eb324b80182b911ce63330ce5d73c36c2f'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
