$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.6.0esr/win64/en-US/Firefox%20Setup%20128.6.0esr.msi'
  checksum      = '1f046cab664a190b3ecf7d0a973f63d17499dd8651ba74372b9c2c1ba4caa7cf'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
