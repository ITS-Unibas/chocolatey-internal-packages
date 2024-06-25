$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.12.0.exe'
  checksum      = 'b8ff9594be035e2ac1d69cda4b7a3e5a48e2908f5060f25853f6924df5cc2799'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
