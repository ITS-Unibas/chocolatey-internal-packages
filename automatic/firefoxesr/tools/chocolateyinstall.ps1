$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.14.0esr/win64/en-US/Firefox%20Setup%20128.14.0esr.msi'
  checksum      = '275114f542d2c3f21f5cbeba9571592da98db9b1ba7bbe1a440fbf3e519162bd'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
