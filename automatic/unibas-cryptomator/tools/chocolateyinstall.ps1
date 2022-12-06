$ErrorActionPreference = 'Stop';

$packageName = 'unibas-cryptomator'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url            = 'https://github.com/cryptomator/cryptomator/releases/download/1.6.16/Cryptomator-1.6.16-x64.exe'
  silentArgs     = '/S'
  validExitCodes = @(0) 
  softwareName   = 'Cryptomator'
  checksum       = '7e2204431540c66e2d02f3b0a6924a2710d223530d864adb6fd5c94806631acd'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
