$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.13.0esr/win64/en-US/Firefox%20Setup%20128.13.0esr.msi'
  checksum      = 'baf0957ddfc05a3fd4058bee2be3c04b52e9cf43c38dbabde360f229df160625'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
