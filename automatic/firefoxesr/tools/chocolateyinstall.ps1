$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.17.0esr/win64/en-US/Firefox%20Setup%20140.17.0esr.msi'
  checksum      = '67c3bdbbea8e3f8b506f1d427bd9728be59d030b4893aae93ea5c2c4201958fe'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
