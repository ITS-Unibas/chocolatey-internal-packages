$ErrorActionPreference = 'Stop';
$checksum = '91f6b5a384f892e2e0599ffb5965f798cce11ddbf05e7c866f6af6c9d2143993'
$checksum64 = 'd01e4bd9128d3efc7dbc53b3f469e9d6905737b31cd24f52b801126c2e055b12'

$url = 'https://cdn.zoom.us/prod/6.2.7.49583/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.7.49583/x64/ZoomInstallerFull.msi'

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
