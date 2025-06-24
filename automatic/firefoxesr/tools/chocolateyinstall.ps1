$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.12.0esr/win64/en-US/Firefox%20Setup%20128.12.0esr.msi'
  checksum      = 'a92e2785e026d08db63c5813f77d8db5681154ac1a76f3a28532dacf9ba264ab'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
