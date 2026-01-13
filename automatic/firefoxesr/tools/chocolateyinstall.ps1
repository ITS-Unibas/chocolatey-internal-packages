$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.7.0esr/win64/en-US/Firefox%20Setup%20140.7.0esr.msi'
  checksum      = 'd77ccd6188e917bba29a221eb985efd7efe718ad03558d33076984d7dd873dde'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
