$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.8.1esr/win64/en-US/Firefox%20Setup%20128.8.1esr.msi'
  checksum      = '3547e6de7e934a8f5666138c2e7cb9995599dcb1dcfe9c778cdfa3c331790ca0'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
