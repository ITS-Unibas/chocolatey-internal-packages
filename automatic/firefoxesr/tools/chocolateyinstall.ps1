$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/128.5.0esr/win64/en-US/Firefox%20Setup%20128.5.0esr.msi'
  checksum      = 'd81809616558f0d8c3bb30fcb8381afa67ce286dea4803515398a174c26f0fe6'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
