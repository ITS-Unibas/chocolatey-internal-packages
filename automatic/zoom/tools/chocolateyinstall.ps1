$ErrorActionPreference = 'Stop';
$checksum = '972bd211ab7d893b528436fae053154be7914ae30a58c809bd468d79b59e4e24'
$checksum64 = '683e1b8f1a96df54b365ce843ca1b3670a024823cb3e9235b596f316bcdca365'

$url = 'https://cdn.zoom.us/prod/6.4.12.64384/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.4.12.64384/x64/ZoomInstallerFull.msi'

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
