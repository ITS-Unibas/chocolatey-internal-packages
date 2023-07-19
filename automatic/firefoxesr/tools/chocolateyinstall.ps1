$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.0.3esr/win64/en-US/Firefox%20Setup%20115.0.3esr.msi'
  checksum      = 'b0571bb5ffc85041391113bfcb2297dcb6fb6e15896630b9b47789c14f5d78976cbe38fd2abc7f66c869048d77269904d4a147d20f4122d81b870471ab2e2932'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
