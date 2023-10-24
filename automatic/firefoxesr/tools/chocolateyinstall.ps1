$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.4.0esr/win64/en-US/Firefox%20Setup%20115.4.0esr.msi'
  checksum      = '5bf52c6dbd68721b1a073fd9478408901cf3c9f42001630e841682e678c6b606bb6ea17743199d4a06bf921eab3c5bceb437f764b9d7e720fe8dc2f8c7018b1c'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
