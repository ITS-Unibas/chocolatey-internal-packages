$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.12.3/Cryptomator-1.12.3-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '0d8ceb8e963b6454687908b5bd2d2f4c792e04fe1ee1dcdedf7228158dd69a7a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
