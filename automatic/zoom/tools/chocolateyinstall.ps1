$ErrorActionPreference = 'Stop';
$checksum = '820cc631a3ddc8891a3aef7c160eafdb79fa4fcdcf85034fd1591d8f8be959d2'
$checksum64 = 'cf10e2bac1e78b5df63771fb558e21b322e2c432b90a773f4af04f1cc4b04055'

$url = 'https://cdn.zoom.us/prod/5.16.1.22523/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.16.1.22523/x64/ZoomInstallerFull.msi'

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
