$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://zoom.us/client/5.0.24046.0510/ZoomInstallerFull.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = '7b215399b936128b45d241be7095327a'
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
