$ErrorActionPreference = 'Stop';
$checksum = 'e71524aa18c471db3973f49707aff44dc4918700f19f66586c48bb4db87dfdbc'
$checksum64 = '80f908158af4ce2c55a1046c4fbcb150ea30da51eb01f92531c357ca437bc3b3'

$url = 'https://cdn.zoom.us/prod/6.1.5.43316/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.1.5.43316/x64/ZoomInstallerFull.msi'

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
