$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.7.0/Cryptomator-1.7.0-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'ec4abd4e50ead7e8d4ac357329457d25163ae6ca1d2bb04796e7f25a198c78e8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
