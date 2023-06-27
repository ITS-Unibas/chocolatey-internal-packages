$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.11.0.exe'
  checksum      = 'a97f27adb4cce045bfac12ffb552ba0f127892a9d7a7e598ea000d039adf56f8'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
