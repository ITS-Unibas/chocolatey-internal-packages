$ErrorActionPreference = 'Stop';
$checksum = '7fbda50c1880edc5b3f76b4423ddb0fcff030044e81ccb289566c8f736888386'
$checksum64 = 'bcd50e9b6b91e0942b2b8c0378a75fe9d0d2601d8e5408b7367f8a86f0926b1d'

$url = 'https://cdn.zoom.us/prod/6.3.0.52884/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.3.0.52884/x64/ZoomInstallerFull.msi'

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
