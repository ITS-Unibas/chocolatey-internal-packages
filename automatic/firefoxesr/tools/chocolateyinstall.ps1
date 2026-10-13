$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/153.5.0esr/win64/en-US/Firefox%20Setup%20153.5.0esr.msi'
  checksum      = '8bdcf514b63c4928e27649b09e699ea4d0823e895edef648bcd22f76cb1e2b5a'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
