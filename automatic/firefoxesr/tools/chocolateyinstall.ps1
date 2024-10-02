$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.3.0esr/win64/en-US/Firefox%20Setup%20128.3.0esr.msi'
  checksum      = 'e00c994f5146825e672936dfcb9f74ef7d901978903fdf041d6b8bfb3ca546ce'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
