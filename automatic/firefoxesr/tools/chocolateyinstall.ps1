$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/68.9.0esr/win64/en-US/Firefox%20Setup%2068.9.0esr.msi'
  checksum      = '6aa15b94ced00ef675da069ac55103045e8c4047dae75a3137e9d7fb6538295c313d95d634b35d61659bce1fd3f774ca80a03c1d7c6785f0da2dae5f49ddc297'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
