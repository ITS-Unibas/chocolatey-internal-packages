$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jamovi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://jamovi.org//downloads/jamovi-1.6.15.0-win64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'unibas-jamovi*'
  checksum64     = 'ece58a12b584c63f6e5c21fa6aad4fca237850e6ae6b1a829777b3b20ab4c89a'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
