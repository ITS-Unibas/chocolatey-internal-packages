$ErrorActionPreference = 'Stop';
$checksum = '7651d29e1544a8fc56e762678e6df1a4ae40d5f2e0e75e43d3776056e90ce35d'
$checksum64 = '7e930f55c3c00a25227cb770a2f7502a436a05ec9dccc8f7f38c4569ef3c3bab'

$url = 'https://cdn.zoom.us/prod/5.15.6.19959/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.6.19959/x64/ZoomInstallerFull.msi'

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
