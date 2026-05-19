$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.11.0esr/win64/en-US/Firefox%20Setup%20140.11.0esr.msi'
  checksum      = 'cb3f7557614c4d525a5caaa72f9f6e4f803c7c6084523dd9803ce8283f0257a5'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
