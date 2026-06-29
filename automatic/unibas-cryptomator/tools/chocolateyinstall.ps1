$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.19.3/Cryptomator-1.19.3-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'e303cced835e1a8a1041580eeaea3b7b3658c348d77ea53a108a95926625c41a'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
