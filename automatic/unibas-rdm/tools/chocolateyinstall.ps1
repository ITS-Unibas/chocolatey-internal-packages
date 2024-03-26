$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.20.0.exe'
  checksum      = '1ff4bfb77a4f2f9c1bbd98e6a4e44809f8d2bb8d090018e2e1e6b56179844cdd'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
