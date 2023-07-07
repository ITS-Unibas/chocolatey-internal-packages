$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.0.1esr/win64/en-US/Firefox%20Setup%20115.0.1esr.msi'
  checksum      = 'a7d70e8beccfbddb5eb33438180c1c5a7a1ed3da62c1f2646a37a554627c3dbfa0355442a47fc92ffcd2cbb49f9351633ac903f0b175b66ff481d4a8298d61c5'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
