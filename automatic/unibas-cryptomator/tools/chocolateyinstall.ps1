$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.19.6/Cryptomator-1.19.6-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'ad416a6dff6ad969c2c346a9050b650e49fe5da9ac30c948148ae6b8412ebbce'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
