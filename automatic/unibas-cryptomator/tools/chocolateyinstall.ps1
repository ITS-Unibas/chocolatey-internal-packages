$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.19.7/Cryptomator-1.19.7-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'e8079987c521549ed32ca37db2480417f31824ef847771428590f01c9e2442f5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
