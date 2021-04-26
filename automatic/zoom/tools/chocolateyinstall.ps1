$ErrorActionPreference = 'Stop';
$checksum = 'dasdasd'
$checksum64 = 'asdad'

$url = 'https://cdn.zoom.us/prod/5.6.1.617/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.6.1.617/x64/ZoomInstallerFull.msi'

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
