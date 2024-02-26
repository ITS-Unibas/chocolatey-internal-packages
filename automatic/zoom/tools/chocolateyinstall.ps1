$ErrorActionPreference = 'Stop';
$checksum = '2165e991c5350d8e68892b69fa03446a10a388ce62d155703010109a74e3a463'
$checksum64 = '740726b32ff6b153eefd43e959e0eaf5c56923d36f4a5c6c636ab4605d1be092'

$url = 'https://cdn.zoom.us/prod/5.17.10.33775/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.17.10.33775/x64/ZoomInstallerFull.msi'

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
