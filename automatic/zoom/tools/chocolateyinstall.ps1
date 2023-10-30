$ErrorActionPreference = 'Stop';
$checksum = 'ae280c37a84a4674bf281aae15aa8fcd3fa2e73ce033e4d159ce21c9e5017f52'
$checksum64 = 'a465ff2bd9124f153d9c1f1c71486e2385dfdc9685b1da5432708956090036ff'

$url = 'https://cdn.zoom.us/prod/5.16.6.24712/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.16.6.24712/x64/ZoomInstallerFull.msi'

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
