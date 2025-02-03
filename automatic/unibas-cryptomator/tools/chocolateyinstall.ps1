$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.15.0/Cryptomator-1.15.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'e8a13a68276236443fd161283d645e9c9ae20a04e434462849827e9cedac6340'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
