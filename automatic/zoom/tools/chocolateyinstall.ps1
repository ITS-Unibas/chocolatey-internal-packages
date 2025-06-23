$ErrorActionPreference = 'Stop';
$checksum = '4c3bc54f49583989e6a2ca8b1d7d4b4088333f8334a7e2b4ebd8f47f4804926c'
$checksum64 = 'ef86477aad666fb4ba208ccf3fcf0c3dfe90bb1389e63ed99cde956217078c1b'

$url = 'https://cdn.zoom.us/prod/6.5.1.6476/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.1.6476/x64/ZoomInstallerFull.msi'

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
