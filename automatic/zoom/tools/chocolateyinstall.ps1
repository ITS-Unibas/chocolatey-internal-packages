$ErrorActionPreference = 'Stop';
$checksum = '2497dafcfc6e2cd64d44f346feff9b44abaeafa0843e4ae6a919fbb7b5409443'
$checksum64 = '62b261bf521aad81ff8e204b56423feeab5d325854eb269dd140defb6ce32ebe'

$url = 'https://cdn.zoom.us/prod/6.0.4.38135/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.0.4.38135/x64/ZoomInstallerFull.msi'

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
