$ErrorActionPreference = 'Stop';
$checksum = '2ad6249a6992ed720c1b995e134aa06b475071e235bcd583dae8aa3bc6c63f25'
$checksum64 = '6ea4e68c6bdabb07c79065c2816312e006ab3283752f3f204b90bc48ae5cf3e3'

$url = 'https://cdn.zoom.us/prod/5.15.12.21574/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.12.21574/x64/ZoomInstallerFull.msi'

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
