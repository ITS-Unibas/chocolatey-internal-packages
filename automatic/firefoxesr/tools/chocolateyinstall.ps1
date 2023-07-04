$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.13.0esr/win64/en-US/Firefox%20Setup%20102.13.0esr.msi'
  checksum      = 'f15befc989f6af1275e65d08b53fa89f350864d8285e8380a8acbaabfc11c3d2f9d507e0e24047a292a239c680ed02bef2c6b7f6724cad462f8432c6ad5d4400'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
