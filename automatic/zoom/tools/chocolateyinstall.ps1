$ErrorActionPreference = 'Stop';
$checksum = '88888525fb2f9555459fdf94f63e15a4de5d11d2e69c020306ade9a7cbc2ce33'
$checksum64 = '92f24cbd36eb38a3997b1247653fe86117bb77a109f90e23f2232cc082d4e50c'

$url = 'https://cdn.zoom.us/prod/6.3.10.59437/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.3.10.59437/x64/ZoomInstallerFull.msi'

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
