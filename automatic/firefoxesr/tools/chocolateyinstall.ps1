$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.6.0esr/win64/en-US/Firefox%20Setup%2091.6.0esr.msi'
  checksum      = '32c6e613963080c528c1271c4ffc0f4ff7577a86bfaa389f86566cc41c52598b4d5548592dfafd38fc0acb3a932ea31a5b300158ecb4a0372e8920b7dd911641'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
