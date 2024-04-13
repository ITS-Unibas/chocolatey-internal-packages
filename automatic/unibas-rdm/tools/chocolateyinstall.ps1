$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.25.0.exe'
  checksum      = '7bd1f9444ca35082b7fe08dc04c7bf774d8a39a038394215426e988aba4ddbf1'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
