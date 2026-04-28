$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.10.1esr/win64/en-US/Firefox%20Setup%20140.10.1esr.msi'
  checksum      = 'eb510116d2772062b316cffd533f799c07c215efcadfd2ef7cfb53f9eb379bb1'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
