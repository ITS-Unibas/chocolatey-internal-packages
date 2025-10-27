$ErrorActionPreference = 'Stop';
$checksum = '993585e96436ecf267f836ed37e0933fe31bffa18e7ec5d5b2e61d7d75798508'
$checksum64 = '7279fef6b5d312665621d5a9e1fef0b95c1001ee661cf0baefaf11659c054801'

$url = 'https://cdn.zoom.us/prod/6.6.6.19875/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.6.6.19875/x64/ZoomInstallerFull.msi'

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
