$ErrorActionPreference = 'Stop';
$checksum = '4ea8d109d1a03f2f0377aa05953001047cd0b03541dcbb8bed61fb8fc9b6b904'
$checksum64 = 'f6181623a856e82c59b632ac371e8fdda267f857d1e4364ce9046cfb362f2672'

$url = 'https://cdn.zoom.us/prod/6.0.0.37205/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.0.0.37205/x64/ZoomInstallerFull.msi'

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
