$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.10.0/Cryptomator-1.10.0-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'f81ae343dccd925881366727b26931b1a3323ae309dca32c24c6967db5a60ea2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
