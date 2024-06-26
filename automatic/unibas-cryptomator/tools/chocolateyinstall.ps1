$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.13.0/Cryptomator-1.13.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'e077c0b0e08cc9bec27ca6990281efc9f361f11b88f80ccf73201dded6af6c98'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
