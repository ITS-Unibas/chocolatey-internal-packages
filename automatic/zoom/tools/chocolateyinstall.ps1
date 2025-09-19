$ErrorActionPreference = 'Stop';
$checksum = '874049fa38119d381790bb79ec21919c9b92de29beaba4ea40ac76da8b129f32'
$checksum64 = 'b9a662f315a51abd168e427910962bc79ecbaa17d2a5d8af95c01d7b2bb7b7fc'

$url = 'https://cdn.zoom.us/prod/6.6.1.15968/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.6.1.15968/x64/ZoomInstallerFull.msi'

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
