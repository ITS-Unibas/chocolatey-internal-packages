$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.14.0/Cryptomator-1.14.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '998b02c07f9df2bb661aee2c571be458a64c981da01e50d1857a6f7b892d67e4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
