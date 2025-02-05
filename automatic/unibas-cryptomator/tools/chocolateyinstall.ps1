$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.15.1/Cryptomator-1.15.1-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '8e8af2420d7cd78f22ac11f3be52253d653075c294e603607b9c61a2bf95775e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
