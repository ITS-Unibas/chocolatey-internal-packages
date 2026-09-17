$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.3.8.0.exe'
  checksum      = '7260F0FE4B647A61AE2EE47EF763EA0874D2CF877AB168B7650EB80ACBDED305'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
