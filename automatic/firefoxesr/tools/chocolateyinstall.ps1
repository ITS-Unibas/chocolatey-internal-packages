$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.10.1esr/win64/en-US/Firefox%20Setup%20128.10.1esr.msi'
  checksum      = '41e522d43d64a0c48c1aa5d379cdc9a48c5ee6d21f3a49083a0d97d35b799724'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
