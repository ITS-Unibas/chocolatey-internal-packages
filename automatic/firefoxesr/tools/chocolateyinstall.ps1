$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.3.1esr/win64/en-US/Firefox%20Setup%2078.3.1esr.msi'
  checksum      = '7f8de9e866d5a5e94914cd3e719093f8ccdb7b4fff53bebb63cfc7880812aab8d4bb35644fd217f1a33bd71a632a317a169b9346a7fa3d035d0ed5182604287b'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
