$ErrorActionPreference = 'Stop';
$checksum = '80eb3a56b1e849f834375bc3c1e83c367c25aa73fef24c3157d1b9b4f522158d'
$checksum64 = 'c8f430eeeac155ac63126e73a189028586c70b79610fb1b3502ee5c1d0096ea8'

$url = 'https://cdn.zoom.us/prod/6.2.6.49050/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.6.49050/x64/ZoomInstallerFull.msi'

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
