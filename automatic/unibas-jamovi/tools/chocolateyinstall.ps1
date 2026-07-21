$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jamovi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = 'https://dl-cdn.jamovi.org/jamovi-2.7.38.0-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'unibas-jamovi*'
  checksum64     = '58150b9dcb4f2f4eb239fa684635968ea441adf05d8b1d57f67ac3132e487645'
  checksumType64 = 'sha256' #default is checksumType
  options        = @{
    Headers = @{ Referer = 'https://www.jamovi.org/download.html' }
  }
}

Install-ChocolateyPackage @packageArgs
