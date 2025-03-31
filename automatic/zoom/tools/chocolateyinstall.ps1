$ErrorActionPreference = 'Stop';
$checksum = 'c8d022dc314a550f789c29e7376f4cf61c83974a06d6ef97281005f224dbe5f7'
$checksum64 = 'f3496b4565e2fc69496db8164b8f9bb1f4beb63e968ac6a8482935717a1f8d8b'

$url = 'https://cdn.zoom.us/prod/6.4.3.63669/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.4.3.63669/x64/ZoomInstallerFull.msi'

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
