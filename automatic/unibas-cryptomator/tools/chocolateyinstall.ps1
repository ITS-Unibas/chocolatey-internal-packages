$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.17.0/Cryptomator-1.17.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '3bae9567d445edb930c7f32f5fa2f288cfde459163ab3681c648161a34059295'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
