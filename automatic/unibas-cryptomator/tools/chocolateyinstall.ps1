$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.19.2/Cryptomator-1.19.2-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '4b34ba8d6525ad258de34c8098f9af2240b1874c6151862f1db1f4f2193911d4'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
