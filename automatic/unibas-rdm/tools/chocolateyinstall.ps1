$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2024.3.27.0.exe'
  checksum      = '4cd1c88ebb75867da0a8188ec7837ed5893d06111800a5c008c3113977a9df73'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
