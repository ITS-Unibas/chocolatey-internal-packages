$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.3.28.0.exe'
  checksum      = '7dec6f3099685fd98b95a93d2910f8cfd8a08b37ab176a8e4148768af2a18d29'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
