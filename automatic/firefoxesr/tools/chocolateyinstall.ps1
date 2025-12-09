$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.6.0esr/win64/en-US/Firefox%20Setup%20140.6.0esr.msi'
  checksum      = '8d0f1626f7e9c5a08c25cae7107dd02748def02271a24c6502c06ecfa85b1f09'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
