$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.12.0/Cryptomator-1.12.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'ffce83e93779974320b4298aafccd40a5105666b1ca79b643cd2d9297bda8720'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
