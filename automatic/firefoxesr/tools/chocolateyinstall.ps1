$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.16.0esr/win64/en-US/Firefox%20Setup%20140.16.0esr.msi'
  checksum      = 'c279780ebcf368a3c4199eaa150ef1ebcca27882423c4cbf31ddcaadfb1012b3'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
