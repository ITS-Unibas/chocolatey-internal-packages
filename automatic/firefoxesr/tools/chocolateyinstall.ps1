$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.10.0esr/win64/en-US/Firefox%20Setup%2078.10.0esr.msi'
  checksum      = '406a0d2701e2edf10d55ed733ad9e0dcaa5c00f2df523b1ed36e7b96785107e98742d1d4386ef7b03386c32cb0df65b9abfbafd21d11d4c5696ba70ec6080da5'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
