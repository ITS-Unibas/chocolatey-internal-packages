$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2022.3.33.0.exe'
  checksum      = '2f773b12b99306798c35a1ae303601888ee301476010e7f169137001e184716a'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
