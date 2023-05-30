$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.9.0/Cryptomator-1.9.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'b5aded24a4da328a56f1326c5a3b21a189152cc91ce640345d50cac81df2f67e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
