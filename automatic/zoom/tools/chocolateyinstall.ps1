$ErrorActionPreference = 'Stop';
$checksum = '1879963a936f141f2cfbbc2fcbb504c9d6d1eeb6f54bcb13425ddb77db7c21e1'
$checksum64 = 'c8f6da1429b60ce5c71b84fd76c5073d424a06f836394a4970324e8e6d48a2d1'

$url = 'https://cdn.zoom.us/prod/6.4.10.64378/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.4.10.64378/x64/ZoomInstallerFull.msi'

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
