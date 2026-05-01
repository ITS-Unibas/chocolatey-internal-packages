$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.1.20.0.exe'
  checksum      = 'B486798001B42303C844843FE1469E97417548CCDF52E307F4C365729EEB5E65'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
