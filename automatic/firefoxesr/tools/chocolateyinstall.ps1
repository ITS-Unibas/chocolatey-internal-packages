$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.5.2esr/win64/en-US/Firefox%20Setup%20128.5.2esr.msi'
  checksum      = 'ad6c5951a6549f151d37f59b14d6a4c3da3ec08f52a853a416de407845aff988'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
