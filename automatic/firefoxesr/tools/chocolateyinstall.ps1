$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/153.8.0esr/win64/en-US/Firefox%20Setup%20153.8.0esr.msi'
  checksum      = '6a6534a3f2bc42771217dda03e640b9be4ea5a7b567873c877da1df154b4fa9e'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
