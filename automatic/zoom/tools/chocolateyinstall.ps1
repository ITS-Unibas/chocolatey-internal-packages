$ErrorActionPreference = 'Stop';
$checksum = 'd9345f78973a4fd4d33d0abdd9acb4601a8e951bf09b2805df6b2005aef675e6'
$checksum64 = '7f36f496622ee34e57986e664ec0751385eb9a5e486052b5515f81900b975b27'

$url = 'https://cdn.zoom.us/prod/5.15.7.20303/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.7.20303/x64/ZoomInstallerFull.msi'

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
