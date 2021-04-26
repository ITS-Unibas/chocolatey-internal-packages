$ErrorActionPreference = 'Stop';
$checksum = 'c711ad0a28440b11cd6873bcde5407cf30a8e4b9be07231feeaa492ef5e578d3'
$checksum64 = '98ffe81448f8aa554d98266f8948d6037fe555773061f16d8583f85273ed0071'

$url = 'https://cdn.zoom.us/prod/5.6.3.751/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.6.3.751/x64/ZoomInstallerFull.msi'

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
