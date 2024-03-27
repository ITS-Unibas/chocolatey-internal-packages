$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.12.4/Cryptomator-1.12.4-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '939809d8bd0e8a31be311bd390c0d70c00196e22c83493a085285d72460474f4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
