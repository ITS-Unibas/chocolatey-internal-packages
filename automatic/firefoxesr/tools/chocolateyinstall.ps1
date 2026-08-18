$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/140.14.0esr/win64/en-US/Firefox%20Setup%20140.14.0esr.msi'
  checksum      = '381eef556c4a2dc1fcaedf31afe886c51bc186274a26c7076c07e23246e3cf28'
  checksumType  = 'sha256'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
