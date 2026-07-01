$ErrorActionPreference = 'Stop';

$packageName = 'unibas-jamovi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = 'https://dl-cdn.jamovi.org/jamovi-2.7.37.0-win-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'unibas-jamovi*'
  checksum64     = '08cda74cc13a92b6f5331348653a4444f4c69baa5f30c7438ffdac4f94090409'
  checksumType64 = 'sha256' #default is checksumType
  options        = @{
    Headers = @{ Referer = 'https://www.jamovi.org/download.html' }
  }
}

Install-ChocolateyPackage @packageArgs
