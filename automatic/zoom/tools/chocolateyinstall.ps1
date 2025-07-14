$ErrorActionPreference = 'Stop';
$checksum = 'b31191c65c9d0b3fde58035d49920b5898b87609f6486680ce4ec1e691ea076d'
$checksum64 = '120b1eda154c2e4933e489c616744ec94dfd20ba671a31b66a7702e0e64b685f'

$url = 'https://cdn.zoom.us/prod/6.5.5.8927/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.5.8927/x64/ZoomInstallerFull.msi'

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
