$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'tierbase'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = ''
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($LogPath)$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
  softwareName   = '4D v*'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
