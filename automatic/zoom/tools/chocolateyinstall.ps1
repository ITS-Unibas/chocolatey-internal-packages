$ErrorActionPreference = 'Stop';
$checksum = '24d97bccad98b1a2fb3318e4e2442508f87e158622694b7b952661c6778c77a8'
$checksum64 = '7190f74544e71ca223b05437dfb2abe0ecf7d8309ed9b881c995f5b9f810acba'

$url = 'https://cdn.zoom.us/prod/6.5.9.11873/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.9.11873/x64/ZoomInstallerFull.msi'

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
