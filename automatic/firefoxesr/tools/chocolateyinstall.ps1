$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.11.0esr/win64/en-US/Firefox%20Setup%20128.11.0esr.msi'
  checksum      = '27a7eb02560bc301b5e0bf277564243e4400c4daf43218b19921bdde69b98ee3'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
