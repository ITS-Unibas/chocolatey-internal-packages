$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.12.0esr/win64/en-US/Firefox%20Setup%20140.12.0esr.msi'
  checksum      = 'bc0e94ea096e6220c58a7301350f9293a8a45f4024315112ca815f363587927e'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
