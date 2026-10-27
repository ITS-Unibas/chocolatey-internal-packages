$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/153.6.0esr/win64/en-US/Firefox%20Setup%20153.6.0esr.msi'
  checksum      = 'd1f6497159ec8284e03e7678479d09001d73f9dbd4f8cda6bed27d6d88f06b71'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
