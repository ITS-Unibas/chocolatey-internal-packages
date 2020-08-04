$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'irfanview'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://zoom.us/client/5.1.28656.0709/ZoomInstallerFull.msi'
  silentArgs     = '/silent /group=1 /alluusers=1'
  validExitCodes = @(0)
  softwareName   = 'irfanview*'
  checksum       = 'f2209071959286d268a8171510d900d3'
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
