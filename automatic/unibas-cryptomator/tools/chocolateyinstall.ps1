$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.6.17/Cryptomator-1.6.17-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'f7cad11d7696a9e5d22574f9bc82afd51a24388910d595c5018798e32d073224'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
