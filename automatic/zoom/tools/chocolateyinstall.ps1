$ErrorActionPreference = 'Stop';
$checksum = '766e981bd2e810e18a883d669799d4a38a86eb58adfe32d51f99be7cc17e98c5'
$checksum64 = 'f3f85d3c3dd6dc342efa3e91ec7649c77e8a770d8b009ea7830c8d360e850497'

$url = 'https://cdn.zoom.us/prod/5.15.1.17948/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.1.17948/x64/ZoomInstallerFull.msi'

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
