$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.19.0/Cryptomator-1.19.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '48f0906ffdcd89c802299a49fdfbe63d367c308dc34879efd3d14c634111cea5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
