$ErrorActionPreference = 'Stop';
$checksum = 'd12e8694b828a39e83337f40b5575c42cdfd8016679b429bf6d14481e7efd0e1'
$checksum64 = '29f654b0f999077c2817f56bd9b9167ba6618ec62b3d9e701858034c40f5d4d5'

$url = 'https://cdn.zoom.us/prod/5.14.7.15877/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.14.7.15877/x64/ZoomInstallerFull.msi'

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
