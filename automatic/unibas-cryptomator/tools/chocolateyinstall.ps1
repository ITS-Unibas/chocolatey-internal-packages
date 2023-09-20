$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.10.1/Cryptomator-1.10.1-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '9712f6622f7cbe84c90f0135c4b53c76ea7feb398c2ecf2a3a04cd2cb17550f1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
