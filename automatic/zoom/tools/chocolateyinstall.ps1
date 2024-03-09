$ErrorActionPreference = 'Stop';
$checksum = '91885a1fa1fc6d43f5487c6b4d6e4b73431ca23f1f487d1f8ba5c6ddf30ec232'
$checksum64 = 'ba6bb5a6d7b8faa6e9c28c3dc14b66b9165328ce0648e31a6de748f594760f90'

$url = 'https://cdn.zoom.us/prod/5.17.11.34827/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.17.11.34827/x64/ZoomInstallerFull.msi'

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
