$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.1.14.0.exe'
  checksum      = 'f96cea402aa1c0aa024c9e828bd285293fab9ecbf59a1823df5eae76513f3ca1'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
