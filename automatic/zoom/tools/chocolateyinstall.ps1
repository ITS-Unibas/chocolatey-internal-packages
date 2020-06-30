$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://zoom.us/client/5.1.28546.0628/ZoomInstallerFull.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = 'ba7872c004f0e5c3cde2b97e9936b9c2'
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
