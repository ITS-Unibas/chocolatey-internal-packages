$ErrorActionPreference = 'Stop';
$checksum = '1d1b1eaa899dbcd7637c66dde6fd97dd52c47936524ff218236d6ab45286c215'
$checksum64 = '0908bc32e6dd60f090390b970708e8749964d6d7948f80b51777a40ea309dfd1'

$url = 'https://cdn.zoom.us/prod/6.3.6.56144/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.3.6.56144/x64/ZoomInstallerFull.msi'

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
