$ErrorActionPreference = 'Stop';
$checksum = '4e7137fb4b349325b2880fff98a473cc1179bd15bc244e73f3b6861a53ffff86'
$checksum64 = '9197f8bfb0ad6737ffa3b74c487c0dfab3ae08c51cd64e9b4395b3471bc5940d'

$url = 'https://cdn.zoom.us/prod/6.3.11.60501/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.3.11.60501/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  url64          = $url64
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
