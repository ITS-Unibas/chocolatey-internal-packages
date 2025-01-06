$ErrorActionPreference = 'Stop';
$checksum = '779624f7e8747ca3348498f8f27dd295ef0dbb63573fedfe4070d8515d35b048'
$checksum64 = '97fad10c1f12c3ad1bff7b470ab99d6e2867ab178f97dc4ae3c6e4907930fcc0'

$url = 'https://cdn.zoom.us/prod/6.3.5.54827/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.3.5.54827/x64/ZoomInstallerFull.msi'

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
