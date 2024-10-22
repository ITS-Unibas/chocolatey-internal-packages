$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.15.0.exe'
  checksum      = 'c01a602a9a3d5279101e51e067a0453f821fe488e66ec4acc8edccc3abea60ca'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
