$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.13.0esr/win64/en-US/Firefox%20Setup%20140.13.0esr.msi'
  checksum      = '084bada1a8c7bd9680ca40ad7841f30c84a816eb0234926a8d753e4994a1ab59'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
