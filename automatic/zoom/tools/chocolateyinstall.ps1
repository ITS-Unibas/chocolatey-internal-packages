$ErrorActionPreference = 'Stop';
$checksum = '744f82b14075fb1cf54979d9b9dec57284e603998f6c06dfa20cf2f11e7e6cf8'
$checksum64 = '18c600aaddd641e333de7343954d5e8e5b08f7385575cb9912986e241e2e65d9'

$url = 'https://cdn.zoom.us/prod/5.14.10.17221/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.14.10.17221/x64/ZoomInstallerFull.msi'

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
