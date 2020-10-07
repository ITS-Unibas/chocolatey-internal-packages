$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'tierbase'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://www.uni-heidelberg.de/md/ibf/datenbanken/4d_v14.6_windows_32-bit.exe'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /LOG=`"$($LogPath)$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).InnoInstall.log`""
  validExitCodes = @(0)
  softwareName   = '4D v*'
  checksum       = '132dc0414466a644581b5ffe58efac6c95e778e3cb745dfdb39cf8ce6002d05d'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
