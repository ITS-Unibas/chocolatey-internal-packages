$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.3.0esr/win64/en-US/Firefox%20Setup%20115.3.0esr.msi'
  checksum      = '8b57dd6609717e248fa9b23ec83484ecda6dc866ae8768d0357cb0dd54f4842d0873be4c99f9d6dd205d9c480ef9075c58b5b33bf02cccd8e3c9c4585809418a'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
