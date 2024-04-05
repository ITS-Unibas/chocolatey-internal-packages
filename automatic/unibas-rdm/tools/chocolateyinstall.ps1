$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.23.0.exe'
  checksum      = '6ac20802dfea1828b8316125fb45b80b6d45199074bebb47ce7b2c395a3c2adc'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
