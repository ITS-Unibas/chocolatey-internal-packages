$ErrorActionPreference = 'Stop';

$packageName = 'unibas-googleearth'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url            = 'https://dl.google.com/dl/earth/client/advanced/current/googleearthprowin-7.3.7-x64.exe'
  silentArgs     = '/S OMAHA=1'
  validExitCodes = @(0)
  softwareName   = 'Google Earth*'
  checksum       = 'e677726d5bf6969eb498d1052039d2b21e7a0658d22f1a76df36120e737783a1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
