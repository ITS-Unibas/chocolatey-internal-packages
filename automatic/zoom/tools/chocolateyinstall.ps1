$ErrorActionPreference = 'Stop';
$checksum = '0060ec09ee6f68fec85d21f9fa03a4ba8120ac986cba4fa126ba11d7a5abf6db'
$checksum64 = '880ccc4df25951527dd4aeeb4731c44fe45ca0c09df214c295c85b4223a7d747'

$url = 'https://cdn.zoom.us/prod/5.17.5.31030/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.17.5.31030/x64/ZoomInstallerFull.msi'

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
