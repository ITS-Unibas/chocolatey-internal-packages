$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.9.1/Cryptomator-1.9.1-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'ab6db933cb6e21fd6436badd91ac3795441be35e9c0843621e1f5d3f96ab4545'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
