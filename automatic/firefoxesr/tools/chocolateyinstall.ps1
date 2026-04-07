$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.9.1esr/win64/en-US/Firefox%20Setup%20140.9.1esr.msi'
  checksum      = '8debc241040c24b056de763778e74b090e53773f5ee0ba2e8b81357066c5ffc7'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
