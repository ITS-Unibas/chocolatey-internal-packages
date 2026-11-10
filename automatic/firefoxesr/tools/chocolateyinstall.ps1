$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/153.7.0esr/win64/en-US/Firefox%20Setup%20153.7.0esr.msi'
  checksum      = 'bf0362dcb431e67d813dd394be50a5e0492eca3a64b40c9811389efdd53dd40f'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
