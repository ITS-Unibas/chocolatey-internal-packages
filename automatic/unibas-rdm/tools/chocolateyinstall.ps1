$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2025.2.29.0.exe'
  checksum      = 'd986d5c72695e10e71500e9be998ce5896a5617559791d79a8fd255100408fe9'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
