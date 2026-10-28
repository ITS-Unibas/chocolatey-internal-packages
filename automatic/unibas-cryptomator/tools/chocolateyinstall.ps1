$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.19.5/Cryptomator-1.19.5-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '36606757e2bcdead1300e25151c6519b82134f2cf12afb1dd5033ca9b2a8b774'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
