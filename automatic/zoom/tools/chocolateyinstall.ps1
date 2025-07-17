$ErrorActionPreference = 'Stop';
$checksum = 'c0b1c6f3b181690be91b99b841919069c17c80baf67213e8eb80df0aa8551180'
$checksum64 = 'e167fa5f157ec0e134a6b3fdd58af9474b9a5d54b9085d1f6245d9c634826ac7'

$url = 'https://cdn.zoom.us/prod/6.5.6.9328/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.6.9328/x64/ZoomInstallerFull.msi'

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
