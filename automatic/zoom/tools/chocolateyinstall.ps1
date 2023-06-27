$ErrorActionPreference = 'Stop';
$checksum = '0a649a20e91f4278753586b940ae7a23f6f62bfe8ac43dff4daf2acfb1da9792'
$checksum64 = 'bd2740f8fcbe751babf6127d617753e548fd51e9b0bd514e09260610f239a879'

$url = 'https://cdn.zoom.us/prod/5.15.2.18096/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.2.18096/x64/ZoomInstallerFull.msi'

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
