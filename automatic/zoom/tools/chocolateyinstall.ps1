$ErrorActionPreference = 'Stop';
$checksum = 'b60c7b6952c6eb7c9d9a7d15c2aa04b350dd8c9d762a10741955ae612c05bbea'
$checksum64 = '63d7e8de490008f09ee88b2ee67ff0588cfa24db2e382d9a7d153bc4649655f0'

$url = 'https://cdn.zoom.us/prod/6.2.2.47417/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.2.47417/x64/ZoomInstallerFull.msi'

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
