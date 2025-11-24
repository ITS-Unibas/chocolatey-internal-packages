$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.23.0.exe'
  checksum      = '3de2d8a7e9c7e5660958505e774ec0c9463273a94ab67f3e7cd015db6876ad09'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
