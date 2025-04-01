$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.9.0esr/win64/en-US/Firefox%20Setup%20128.9.0esr.msi'
  checksum      = '24d139afc29906505818e0c98c7eb958e1395c165b0e5adc692a29b04a52bb22'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
