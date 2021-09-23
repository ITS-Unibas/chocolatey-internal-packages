$ErrorActionPreference = 'Stop';
$checksum = 'ecab043524e99c51b179327587e2b4b324f7c6a7fade55c63e5a9bfb7367db9e'
$checksum64 = '857ba9a19abc1625104a63f3c5c900d487fb695f5407eb408e35374fdb61dc3a'

$url = 'https://cdn.zoom.us/prod/5.8.0.1324/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.8.0.1324/x64/ZoomInstallerFull.msi'

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
