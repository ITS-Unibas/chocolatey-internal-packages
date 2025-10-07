$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.15.0.exe'
  checksum      = '2ddf92719f37f63f91dce142e3e87e72caf523ce6effc2d8adcf3139d25ea76c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
