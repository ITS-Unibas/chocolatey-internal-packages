$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.5.1esr/win64/en-US/Firefox%20Setup%20128.5.1esr.msi'
  checksum      = 'ea92ee3352be71e4ef8346ed2ca5fc8bcc111ab28f4716c5f745337637a25580'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
