$ErrorActionPreference = 'Stop';
$checksum = '2854b47897d732175ba46d461356cc661eddd3f940a62951a1bf917d5fbf419e'
$checksum64 = 'cefc859fb1dd775398295cca4adc55ab01abf137a0b2d53f1d9c321fd3b356a4'

$url = 'https://cdn.zoom.us/prod/5.15.10.20823/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.10.20823/x64/ZoomInstallerFull.msi'

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
