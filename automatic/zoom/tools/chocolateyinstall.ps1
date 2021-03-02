$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://zoom.us/client/5.5.13142.0301/ZoomInstallerFull.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = '97d4f8e3ab287a38b49f93b7a0f9f246'
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
