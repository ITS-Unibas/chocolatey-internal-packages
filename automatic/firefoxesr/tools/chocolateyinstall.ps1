$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.4.0esr/win64/en-US/Firefox%20Setup%20128.4.0esr.msi'
  checksum      = '39caf1a519d129719166853e090dcb8169c5848fd29a2bc16f18ecc3ee192f1a'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
