$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.28.0.exe'
  checksum      = '8c28adafbd14e144013c0ee2b7d945086308edcc3d833544054191509e9c9410'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
