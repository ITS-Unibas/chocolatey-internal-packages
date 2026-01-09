$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.29.0.exe'
  checksum      = 'f1c337c5ce2b9f9fbe3f87736068c2c002739532d735b2fd2bb0436ad6f11336'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
