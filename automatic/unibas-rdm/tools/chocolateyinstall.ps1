$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.11.0.exe'
  checksum      = 'ee0c95034303d733c1b8160ee62144bdcae99d361c3523f61f026d3ca637797f'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
