$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.18.1/Cryptomator-1.18.1-x64.msi'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '491fdba6a5e45e47fb7ac6f437b8f749b95ee6f58997b854ac7072a7ff45310e'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
