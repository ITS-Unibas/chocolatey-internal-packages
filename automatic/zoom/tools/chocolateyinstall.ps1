$ErrorActionPreference = 'Stop';
$checksum = '7550f00d1c155321b221da5c6af655e95b7c142bb4e20f14877bd249ed2d2767'
$checksum64 = 'f53d82d9ff930f6504e0fc7070664f45d4e7bc0826584b1b9ad40dff7d0cb4e0'

$url = 'https://cdn.zoom.us/prod/6.1.11.45504/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.1.11.45504/x64/ZoomInstallerFull.msi'

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
