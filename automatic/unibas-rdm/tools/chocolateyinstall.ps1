$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.25.0.exe'
  checksum      = 'e36b852d744edd70ebdcb0c7572182fb42b18d806b591769d44e206473a7cc33'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
