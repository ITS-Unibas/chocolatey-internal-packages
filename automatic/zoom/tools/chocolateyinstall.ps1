$ErrorActionPreference = 'Stop';
$checksum = 'eae122df360974349d0cec25844e659f482a3730672e95bf6f55a543322b1c45'
$checksum64 = 'b900f45362252d4c7b00d2a4e9086763f107f52e95300b890e74a707974a03ff'

$url = 'https://cdn.zoom.us/prod/6.5.7.9933/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.7.9933/x64/ZoomInstallerFull.msi'

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
