$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.14.2/Cryptomator-1.14.2-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '521f49f22f2c3f4722c2a5ef5e069b673b73963ecbe576b2f13687eb687b2d56'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
