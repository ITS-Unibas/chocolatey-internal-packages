$ErrorActionPreference = 'Stop';
$checksum = '6b5c19c01592b84799a74920cbb97e3f65fc1905fadd6150589318983eae56b4'
$checksum64 = 'a40f713bdaa799084bf75afd943751a5e3517a4a56399bf9816a5a58283ca2ca'

$url = 'https://cdn.zoom.us/prod/6.5.12.14128/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.12.14128/x64/ZoomInstallerFull.msi'

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
