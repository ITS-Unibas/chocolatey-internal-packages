$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.21.0.exe'
  checksum      = '5211e2746ba05690bb9218a663ddd06841794237baf8691f9cc00381f897bc9d'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
