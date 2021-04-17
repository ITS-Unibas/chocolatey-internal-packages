$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jamovi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://jamovi.org//downloads/jamovi-1.6.23.0-win64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'unibas-jamovi*'
  checksum64     = '59eda2aec3ef929aca5a28d164d64a2487a707533f0609cb7a0f7705b1652e85'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
