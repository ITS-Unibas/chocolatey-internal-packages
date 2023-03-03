$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.7.1/Cryptomator-1.7.1-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'da51534999516fdc3f478a39df8f722791b3b39d5e3901f4e2e4b80c2b788e29'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
