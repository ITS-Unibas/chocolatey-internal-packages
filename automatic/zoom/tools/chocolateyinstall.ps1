$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://zoom.us/client/4.6.20559.0413/ZoomInstallerFull.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = '7cee4c49ebb1fa2a35d5209d02081b8c'
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
