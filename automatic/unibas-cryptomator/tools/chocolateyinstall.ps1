$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.16.0/Cryptomator-1.16.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'df49eecb6dad107bc15348f7230e0b8729af0e2b2ec5ee96a6f1677a226b2fc3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
