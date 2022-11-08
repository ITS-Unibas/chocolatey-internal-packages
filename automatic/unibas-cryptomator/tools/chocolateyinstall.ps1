$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.6.11/Cryptomator-1.6.11-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = 'e6bf0ab11e3b32b262ba79538f40361a757fcc662d268e868266f59d349c9a0c'
  checksumType   = 'sha256'
}

Install-ChocolateyInstallPackage @packageArgs