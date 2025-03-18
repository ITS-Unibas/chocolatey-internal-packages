$ErrorActionPreference = 'Stop';
$checksum = '08c1bb025bc782fd88268a4a9f817a1f2f64c93dcbf29b1ebbcaa8f7b710b158'
$checksum64 = '04ad1a7fbe543517acad73f61be3f1e75560351f55f0e8d18069931b04c16df0'

$url = 'https://cdn.zoom.us/prod/6.4.0.62047/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.4.0.62047/x64/ZoomInstallerFull.msi'

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
