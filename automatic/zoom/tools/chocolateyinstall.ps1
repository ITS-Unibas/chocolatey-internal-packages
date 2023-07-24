$ErrorActionPreference = 'Stop';
$checksum = 'c42404dd84f28564351fbb232fbf2b0cdc372200228dee0da942ab9c534020e6'
$checksum64 = 'f226feaaebfa95dab41c61c5bc43d0d419b693e2011db231cec8fb521fb52dd1'

$url = 'https://cdn.zoom.us/prod/5.15.5.19404/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.5.19404/x64/ZoomInstallerFull.msi'

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
