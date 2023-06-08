$ErrorActionPreference = 'Stop';
$checksum = '41a64d003bd6a1a1c708b23227f2f911fc04d244a4d51bbd1c567caf32145fe7'
$checksum64 = '6d5a6b24b43cd80cb6587e07b462f0d05847b8adfde73e8fd40d119f1448505c'

$url = 'https://cdn.zoom.us/prod/5.14.11.17466/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.14.11.17466/x64/ZoomInstallerFull.msi'

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
