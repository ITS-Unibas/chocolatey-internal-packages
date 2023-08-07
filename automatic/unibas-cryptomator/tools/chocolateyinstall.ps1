$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.9.3/Cryptomator-1.9.3-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '769310d33edad3a4c5da5a8f0c00a2a59a536b47307d5e708c08d535c06fdd59'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
