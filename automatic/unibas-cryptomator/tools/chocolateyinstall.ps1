$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.8.0/Cryptomator-1.8.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '05f38254ad288516f13bd1bdaf7d4f72316629f4d976df2c49b144732149f4c8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
