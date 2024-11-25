$ErrorActionPreference = 'Stop';
$checksum = '8ce914a099a6d36889023115dc60ea4a830c47dbb6dea855a5692ae7e62fc6cd'
$checksum64 = '8b1f4c71a356c6821697baeec7e7ec9d1b80e666cccd4591741d3936c3d268e5'

$url = 'https://cdn.zoom.us/prod/6.2.11.50939/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.11.50939/x64/ZoomInstallerFull.msi'

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
