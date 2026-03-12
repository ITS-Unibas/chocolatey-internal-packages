$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.19.1/Cryptomator-1.19.1-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '77ff121b725938bc05efaa842cfd7db2bbe0f32ca76c93b98c65b225d226d7fd'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
