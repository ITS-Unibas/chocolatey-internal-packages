$ErrorActionPreference = 'Stop';
$checksum = '19acfaa6bf141e833dc62353561555beffeb670ba5f0dd0e657d38c377e0c7cd'
$checksum64 = 'bad90eb5984de4f74c7ca894347e87137b041b9545e042ae723633c3266b1916'

$url = 'https://cdn.zoom.us/prod/5.17.7.31859/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.17.7.31859/x64/ZoomInstallerFull.msi'

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
