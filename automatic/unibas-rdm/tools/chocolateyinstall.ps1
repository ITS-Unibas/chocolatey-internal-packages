$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.3.21.0.exe'
  checksum      = '45878d665ae4270fa3fd302a4a3a9fb78bcf385c36115fcbd59a45b9a3895d55'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
