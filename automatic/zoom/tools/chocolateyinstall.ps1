$ErrorActionPreference = 'Stop';
$checksum = '96c4f5bb6ded15fe92a5523ed5fc6715a5b92677cf406eaf3360ae0003ba8de6'
$checksum64 = 'f6fb3e7941c727ef053aa494c732fe355314704af5aba4dc9f74e5848b2883b6'

$url = 'https://cdn.zoom.us/prod/6.2.5.48876/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.5.48876/x64/ZoomInstallerFull.msi'

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
