$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.7.3/Cryptomator-1.7.3-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '3d2f0ffdc83a480b267167ac8fe4b8e022232604f1970a514d2d2cd57a5a894c'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
