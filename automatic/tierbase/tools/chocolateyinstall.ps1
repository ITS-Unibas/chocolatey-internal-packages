$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'tierbase'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://heibox.uni-heidelberg.de/f/508ffd3c94fd4d119e30/?dl=1'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($LogPath)$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
  softwareName   = '4D v*'
  checksum       = '03aab34a5bf1d2d1b67fd18414a5c9128e825c6174e24555905d6510e1265508'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
