$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.12.2/Cryptomator-1.12.2-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '80aecaa363aa885310959e24994d6704275eb5fe32ae364c2f540fc02f398c30'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
