$ErrorActionPreference = 'Stop';
$checksum = '9d3f0f1f7821fb07ea753a83a1dac240e248e1abc622f8218f710d8ba5f0068e'
$checksum64 = 'aec26bfbe031bc4129e45ba950e9d540b987d14e81efce0a8f3372d2eb07e7c5'

$url = 'https://cdn.zoom.us/prod/5.7.5.1020/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.5.1020/x64/ZoomInstallerFull.msi'

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
