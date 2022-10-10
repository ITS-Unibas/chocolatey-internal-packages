$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jamovi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://jamovi.org//downloads/jamovi-2.3.18.0-win64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'unibas-jamovi*'
  checksum64     = 'f27f873710df79a8496b5c425327b465bf8b36f772fc9deb76b92cd64bbc186b'
  checksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyPackage @packageArgs
