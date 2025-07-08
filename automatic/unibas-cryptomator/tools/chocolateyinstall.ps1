$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.17.1/Cryptomator-1.17.1-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '794435f090232a8af2d0e9fb770e02ce2d99326323433a46f4125cefb3e6713b'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
