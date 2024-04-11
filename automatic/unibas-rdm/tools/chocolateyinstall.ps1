$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.1.24.0.exe'
  checksum      = '1129839c46c79b9813883344524f43a1b9cc7e456e8442fddcaabb3bcf32d53d'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
