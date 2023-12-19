$ErrorActionPreference = 'Stop';
$checksum = '3936158e0be001922ee0444e0f496b60ce29b7379a9b5a553a291356a593e4a5'
$checksum64 = '230dff31ea8e0280e24104fa27b063f633fa0174e9f4a7605e4b8ce3f94c1364'

$url = 'https://cdn.zoom.us/prod/5.17.0.28375/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.17.0.28375/x64/ZoomInstallerFull.msi'

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
