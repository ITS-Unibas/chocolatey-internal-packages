$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.19.4/Cryptomator-1.19.4-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '521c8eb33a7a65efb8cd0eb1f78d25c9b8300aa7d680da26a5c6203bb7af4c55'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
