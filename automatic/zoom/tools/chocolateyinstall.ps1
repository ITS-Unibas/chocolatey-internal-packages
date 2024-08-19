$ErrorActionPreference = 'Stop';
$checksum = '67f0a3c63be76fe0f028a942eafa9ef160f5813aad3a049ed5c91e9bb9254cb4'
$checksum64 = 'cbd6d3398f8c3b146b203f8c43755ff3497da7bf1c58598a91d4cd9528f212cf'

$url = 'https://cdn.zoom.us/prod/6.1.10.45028/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.1.10.45028/x64/ZoomInstallerFull.msi'

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
