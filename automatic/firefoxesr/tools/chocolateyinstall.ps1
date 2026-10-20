$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/153.5.1esr/win64/en-US/Firefox%20Setup%20153.5.1esr.msi'
  checksum      = 'b15660f2d7dc4d0dfda05e4e1499ec090bc554a517fe35dae821106835868fdd'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
