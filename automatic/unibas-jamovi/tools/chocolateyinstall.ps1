$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jamovi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://jamovi.org//downloads/jamovi-2.6.24.0-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'unibas-jamovi*'
  checksum64     = '2ead75abdbeaf62fbbd360a2d3d1c0b7e38be3548c38cec9a799c410fe14363b'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
