$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.30.0.exe'
  checksum      = 'd2662d8978373d09fe02d461dd6917872a30ba8a1154c3827d11aaecd42c2788'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
