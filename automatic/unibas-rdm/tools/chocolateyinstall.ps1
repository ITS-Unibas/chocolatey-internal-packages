$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.25.0.exe'
  checksum      = 'b6369b54db04d249ca9067d436c51a5a7c621fde789cb026d75ad806d1d0ecff'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
