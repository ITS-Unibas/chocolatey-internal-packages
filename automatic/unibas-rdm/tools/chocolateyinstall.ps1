$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.2.10.0.exe'
  checksum      = 'ffecd2586c6bc5e5caa39238d5f54c06b56742e6e7640b4f520e159163be8252'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
