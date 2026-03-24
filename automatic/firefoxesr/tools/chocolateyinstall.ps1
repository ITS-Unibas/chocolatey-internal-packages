$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.9.0esr/win64/en-US/Firefox%20Setup%20140.9.0esr.msi'
  checksum      = 'b8224ad48cc5e872873a67ce5928bc570f0d6c6dd02ea343c03503b6fa3cb9dc'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
