$ErrorActionPreference = 'Stop';
$checksum = '1b5b96b18fc0b6887d4165b2b9d3d7f72a201627fe07a4da2164b9f71391d272'
$checksum64 = 'c21162c2423d5466a1002b84ab0ef9549d47aefd37ff3d2f48c63e71a04fa202'

$url = 'https://cdn.zoom.us/prod/5.16.5.24296/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.16.5.24296/x64/ZoomInstallerFull.msi'

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
