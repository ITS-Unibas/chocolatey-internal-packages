$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.9.2/Cryptomator-1.9.2-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'b82f99aebc470fb540418a0c560f7e33a2c9f4d2582ab34a6ee757e57f18c3e7'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
