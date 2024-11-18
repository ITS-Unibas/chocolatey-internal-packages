$ErrorActionPreference = 'Stop';
$checksum = 'a35b23fe4cf1195d94eb6d5435cd89480127f201124d50fb7b278d64d3485fba'
$checksum64 = '00d616a8a06a934379b9ef37e4a432bd69c1b7fcd906635f077003cea4671bba'

$url = 'https://cdn.zoom.us/prod/6.2.10.50536/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.10.50536/x64/ZoomInstallerFull.msi'

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
