$ErrorActionPreference = 'Stop';
$checksum = '4fce37df66eda926a0e540dd8c18e3519b9f5e690f5fb70c3f39cd733a80a5de'
$checksum64 = 'a9d80eb47e7e45cfe180241916b405deeba5bf529445c53e3bb1193580ecab55'

$url = 'https://cdn.zoom.us/prod/6.1.1.41705/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.1.1.41705/x64/ZoomInstallerFull.msi'

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
