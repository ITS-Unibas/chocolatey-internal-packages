$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.11.1/Cryptomator-1.11.1-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'ab8ca3f3666fddb37f8918480733b6d01d9ab425ce6d4f22cb2c590603ecd669'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
