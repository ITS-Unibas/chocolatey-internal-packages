$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.7.0esr/win64/en-US/Firefox%20Setup%2091.7.0esr.msi'
  checksum      = 'f47551ac3df2bea4387d055efc63b2569ffc4dbba396ff9950d2565896f34895263fa16ff2635c2501fcb543f62eff720ed3acf6a66ee71345b36bd45a294f16'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
