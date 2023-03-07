$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.7.2/Cryptomator-1.7.2-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '3d023ed05bdde2436d0f24a0928b9e0c62e5813357f31c192b629095e34aa894'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
