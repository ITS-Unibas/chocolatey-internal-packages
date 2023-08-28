$ErrorActionPreference = 'Stop';
$checksum = '9819beb511a70d61e3effb1e0ba38210447e7fc0c1716da54bec127d89edc57d'
$checksum64 = '0bb905e1b8d72486ad6c2c291e19749f1cdc58a1db5ba04b6815df72dbc573b4'

$url = 'https://cdn.zoom.us/prod/5.15.11.21032/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.11.21032/x64/ZoomInstallerFull.msi'

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
