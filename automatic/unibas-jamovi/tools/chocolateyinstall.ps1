$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jamovi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://dl-cdn.jamovi.org/jamovi-2.7.31.0-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'unibas-jamovi*'
  checksum64     = '1fb79a52017d3e02ddc3288cf1ec5ea7d90ea8b39edf7dc5b9e4f7afd01ca14d'
  checksumType64 = 'sha256' #default is checksumType
  options        = @{
    Headers = @{ Referer = 'https://www.jamovi.org/download.html' }
  }
}

Install-ChocolateyPackage @packageArgs
