$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.18.0/Cryptomator-1.18.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '9f7d959427046114607083e2f05108a804fd6151fc39ad76520b6c1fb64f32a8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
