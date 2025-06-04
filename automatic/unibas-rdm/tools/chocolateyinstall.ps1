$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.13.1.exe'
  checksum      = '050a0fd732156d4d4c2b8a3fcafaa15ab82342b44bbfe40f1bbf9d71d1e01203'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
