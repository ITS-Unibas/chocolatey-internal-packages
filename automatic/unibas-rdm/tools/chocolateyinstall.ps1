$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.1.33.0.exe'
  checksum      = '89c48530bed294587f3969ead619640df4022a23f19a021d91754606035eb820'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
