$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.15.2/Cryptomator-1.15.2-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'd97a3aa93b1a7eebbd1e0918e4a92a584c1adeae382baec98dccf2abfbfce45a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
