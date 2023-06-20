$ErrorActionPreference = 'Stop';
$checksum = '06af005bef7601da85c1669a2ac6d7be67171a1c5ea98260b1d411250cf7a0fa'
$checksum64 = 'c513994b92e033af6b872a95870cc23f5ed472e50e01798f194a148c2aeefd7c'

$url = 'https://cdn.zoom.us/prod/5.15.0.17890/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.0.17890/x64/ZoomInstallerFull.msi'

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
