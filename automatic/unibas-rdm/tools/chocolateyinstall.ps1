$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
  
$packageArgs = @{
  packageName   = 'unibas-rdm'
  softwareName  = 'remote desktop manager*'
  fileType      = 'EXE'
  silentArgs    = '/S'
  validExitCodes= @(0)
  url           = 'https://cdn.devolutions.net/download/Setup.RemoteDesktopManager.2023.2.30.0.exe'
  checksum      = '22cf12fcb533ee0f1cdeb93a815ce2ad21680ddb705a8892fa2934bce9bfcb3c'
  checksumType  = 'sha256'
}
 
Install-ChocolateyPackage @packageArgs
