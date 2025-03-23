$ErrorActionPreference = 'Stop';
$checksum = '11f4801d5929554efabfa1b8e9cf923b8b247ff27d5d5c454c63ab0d7e3d53d2'
$checksum64 = '3c71e714725c9f07cf73369af5756d1ff12b5ae4e4fa0ebfd33485d28156c911'

$url = 'https://cdn.zoom.us/prod/6.4.2.62735/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.4.2.62735/x64/ZoomInstallerFull.msi'

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
