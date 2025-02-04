$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.7.0esr/win64/en-US/Firefox%20Setup%20128.7.0esr.msi'
  checksum      = 'ec232f13c803a8671c71144a5a7a298baad597dd8fd3ce53fe28faefe6937222'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
