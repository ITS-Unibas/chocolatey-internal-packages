$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.11.0esr/win64/en-US/Firefox%20Setup%2078.11.0esr.msi'
  checksum      = 'f6355611f4bef09af45cdc6df94b904637aedfee75496b1652e509de81186c8c8dd75cd451c19f92a9b8f81c87c231e84e8044375a8fcfb0099007c9a7bc6dda'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
