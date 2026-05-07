$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.10.2esr/win64/en-US/Firefox%20Setup%20140.10.2esr.msi'
  checksum      = '3492e78a396f81ad38371b01736f9589e74797ef389336341ef7fa1cd0182492'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
