$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://zoom.us/client/4.6.20613.0421/ZoomInstallerFull.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = '5ff88a8242d5ce471ce4439fa9b2db45'
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
