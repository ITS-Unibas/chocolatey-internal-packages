$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.9.0esr/win64/en-US/Firefox%20Setup%2078.9.0esr.msi'
  checksum      = 'ef2567b1d93f84b9acaf194e3d4321a6bfc41a388e58ea0af757c6e8b5da85386c5cba7fa8544ead2ed95e20b951f60a268b881b3ad6aff7c772789a8af6ce9b'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
