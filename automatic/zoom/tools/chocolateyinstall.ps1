$ErrorActionPreference = 'Stop';
$checksum = '506274203078d583de7cceee3d59cd1505890078b2197386e4221af26b32aec1'
$checksum64 = 'f8a8fed1ba68609d9fa9afeab799aad98d0e424b4fe1b74ad1cba001c7d39a5a'

$url = 'https://cdn.zoom.us/prod/6.5.11.13227/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.11.13227/x64/ZoomInstallerFull.msi'

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
