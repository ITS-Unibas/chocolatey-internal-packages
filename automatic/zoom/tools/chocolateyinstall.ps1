$ErrorActionPreference = 'Stop';
$checksum = 'e55c7e975aeba37c23f121107c17b447db2cd87d7b593bdc8240ef182b111498'
$checksum64 = '52522b47af2b2e40ae88f64dc9dd352629e5215e1f262a46797a0c8da63f9984'

$url = 'https://cdn.zoom.us/prod/5.17.1.28914/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.17.1.28914/x64/ZoomInstallerFull.msi'

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
