$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.3.1esr/win64/en-US/Firefox%20Setup%20140.3.1esr.msi'
  checksum      = 'f174e1d5f8f57859aa1a33b889932c3a98fcc0dce89b517e20ed7cc2e808b7c1'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
