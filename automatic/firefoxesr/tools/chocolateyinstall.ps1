$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.3.1esr/win64/en-US/Firefox%20Setup%20115.3.1esr.msi'
  checksum      = '8740ed6dafe93654366903a0266b10d7120509e7f973ec3faee7bfcc78354ed7f74258dca788df677535d00505bc9a0e95424981a9984e6fdd6de777e0d6b199'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
