$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.11.0/Cryptomator-1.11.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'b11fec1cbba4bbd451b91ab7a56d89c762f688ab0377a4d1ddfbe074c4ee68ab'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
