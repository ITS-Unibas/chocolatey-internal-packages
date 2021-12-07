$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.4.0esr/win64/en-US/Firefox%20Setup%2091.4.0esr.msi'
  checksum      = '895756803ea24b04f87b1fbc7d8753fdeed3662f9730ec059ab84d52ce07632f210cc9e2eb14cb1ea0f2e694b806f4c4389286cd6a66a4e44052ef891c9c41a8'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
