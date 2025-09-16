$ErrorActionPreference = 'Stop';
$checksum = 'ec3cdf4e2c5ea01b2b3fe34eb24dcd2ee2dffa68248de5c0b28563e0cee719b6'
$checksum64 = 'd44f0ae48a1d112cd8441ea33c1be909bfcad37ee10b779a3b977a5e2d66fdee'

$url = 'https://cdn.zoom.us/prod/6.6.0.15547/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.6.0.15547/x64/ZoomInstallerFull.msi'

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
