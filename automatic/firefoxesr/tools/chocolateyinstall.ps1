$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.7.0esr/win64/en-US/Firefox%20Setup%20102.7.0esr.msi'
  checksum      = 'fa51b1cd24ebb85e6e72f0f8fb57f449670e109a6fe9b77375d6c273ca534ddfb67d4d75bdf53507a1cae6524c953e7cc6d43e7558a9016e401108e48d45a0d7'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
