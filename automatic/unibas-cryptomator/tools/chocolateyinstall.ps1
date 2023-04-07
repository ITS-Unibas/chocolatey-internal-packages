$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.7.5/Cryptomator-1.7.5-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '0f8f14174967dcd804f9311cdc684cab8c91e1f84e3f99c89edee8e44880e030'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
