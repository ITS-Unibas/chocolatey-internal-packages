$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.8.0esr/win64/en-US/Firefox%20Setup%20128.8.0esr.msi'
  checksum      = '1dc1b891913a836b5b079e7e6c58ddd14b4175d22caf9dcebd84bc381e46ba9f'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
