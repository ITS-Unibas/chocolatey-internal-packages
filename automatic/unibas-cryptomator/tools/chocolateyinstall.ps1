$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.6.15/Cryptomator-1.6.15-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '8de5af809f92acb5bf957e6dc02b519e6552a29903b57d724e208dca28e1a87f'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
