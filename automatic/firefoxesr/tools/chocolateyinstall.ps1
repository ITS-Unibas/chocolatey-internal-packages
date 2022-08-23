$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.2.0esr/win64/en-US/Firefox%20Setup%20102.2.0esr.msi'
  checksum      = '48bd2b264f10bf16ac13db215b587b3a74937cc3792de0731039aad57c354f193c5a618575601263ba97d69a79d50add8d97097693090edcbc8593ca06c8c966'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
