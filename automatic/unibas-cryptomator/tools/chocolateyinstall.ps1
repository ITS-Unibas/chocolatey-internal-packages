$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.7.3/Cryptomator-1.7.3-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '47f3a48972244f0d0c0f09b833a28232013d691eff3080943e9200cd0af36783'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
