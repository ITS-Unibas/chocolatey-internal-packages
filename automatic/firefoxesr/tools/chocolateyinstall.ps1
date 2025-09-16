$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.3.0esr/win64/en-US/Firefox%20Setup%20140.3.0esr.msi'
  checksum      = 'c0ace13722965faaaa6206c6e0f361d049d0fa79763dc3dc1df833208f864fbb'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
