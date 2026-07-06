$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2026.2.13.0.exe'
  checksum      = '90873B51F87AF93874DF9E44659143DC8CF9E107AF73533A6A3733AD4F499B3E'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
