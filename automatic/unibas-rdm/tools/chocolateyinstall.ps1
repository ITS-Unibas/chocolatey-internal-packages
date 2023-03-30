$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.18.0.exe'
  checksum      = 'c7e2647643e6e58509c45a8ba456df60239e35c7b36ba1a76254c6cd27943847'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
