$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.6.0esr/win64/en-US/Firefox%20Setup%20102.6.0esr.msi'
  checksum      = 'fdb2ae6d3067bdc4ae389eb44c25b720225fdb5c461b7fc0ee04be469fbcf11f0b32a0b3383b24a08bc3b1f3461cbcbe187fa52e8e852099bf6ef982add38004'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
