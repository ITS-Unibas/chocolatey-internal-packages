$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jamovi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = 'https://dl-cdn.jamovi.org/jamovi-2.7.31.0-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'unibas-jamovi*'
  checksum64     = ''
  checksumType64 = 'sha256' #default is checksumType
  options        = @{
    Headers = @{ Referer = 'https://www.jamovi.org/download.html'; 'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' }
  }
}

Install-ChocolateyPackage @packageArgs
