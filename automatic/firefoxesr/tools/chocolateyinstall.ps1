$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.0.2esr/win64/en-US/Firefox%20Setup%20115.0.2esr.msi'
  checksum      = '77946b1aab4bae57e53a94c3edf158f1436809aa6945b39451628af11e601cc2fef97e03ce0a44df4d2d77f2754da545a7cc8cb58f00afcc1140ec5f59e2dd0c'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
