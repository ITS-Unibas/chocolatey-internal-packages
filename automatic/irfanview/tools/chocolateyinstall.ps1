$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'irfanview'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://zoom.us/client/5.1.28656.0709/ZoomInstallerFull.msi'
  silentArgs     = '/silent /group=1 /allusers=1'
  validExitCodes = @(0)
  softwareName   = 'irfanview*'
  checksum       = ''
  checksumType   = 'md5'
}

Install-ChocolateyPackage @packageArgs
