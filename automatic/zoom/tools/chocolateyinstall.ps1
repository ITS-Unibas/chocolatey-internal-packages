$ErrorActionPreference = 'Stop';
$checksum = 'f73d5da8f8375236bcb88df999d17f9c78cd308275fc3f5614541a8aff83e638'
$checksum64 = '045c4850f6395b76555ed1df4353ca03a09898b56ec6ce8c4fa01f58179a0d63'

$url = 'https://cdn.zoom.us/prod/6.0.11.39959/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.0.11.39959/x64/ZoomInstallerFull.msi'

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
