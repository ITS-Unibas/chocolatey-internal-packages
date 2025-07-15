$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.21.0.exe'
  checksum      = 'd7e3bc45179933d9538fa2eff6c42989838004f2d2b4318368579042ab434871'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
