$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2022.3.31.0.exe'
  checksum      = '9a1ddeb3b514b62586d3d9a24442482ccc961ae64a4950df8decdb6cf219e295'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
