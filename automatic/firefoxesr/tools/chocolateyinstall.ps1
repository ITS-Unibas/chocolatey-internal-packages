$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.10.0esr/win64/en-US/Firefox%20Setup%20128.10.0esr.msi'
  checksum      = '903fa7d0c82f6c1494f8e69ddbb867951ff3795e024df37452e40ff84ff05b5a'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
