$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.7.4/Cryptomator-1.7.4-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '2752e864e5c57ba5620c2c63752e8637bd42cb1451bca6cd518b5207514d46c8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
