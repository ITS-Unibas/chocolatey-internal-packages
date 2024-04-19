$ErrorActionPreference = 'Stop';
$checksum = '64ba5638622e953bdceb7463ca0838d350e22e3fe798ad384b37fc85cb8d769c'
$checksum64 = '1e42c274460722ea090d93413f651aba0c67c84bad51e72b14989a13edd439d7'

$url = 'https://cdn.zoom.us/prod/6.0.2.37566/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.0.2.37566/x64/ZoomInstallerFull.msi'

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
