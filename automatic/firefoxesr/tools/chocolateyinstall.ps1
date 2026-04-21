$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.10.0esr/win64/en-US/Firefox%20Setup%20140.10.0esr.msi'
  checksum      = '0db48eb07a15d5c68b37eb2c5ad0824d2eb3fe94073b5b544bf6362aa6d54b69'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
