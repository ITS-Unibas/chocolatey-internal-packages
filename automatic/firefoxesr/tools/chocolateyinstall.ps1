$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.6.0esr/win64/en-US/Firefox%20Setup%2078.6.0esr.msi'
  checksum      = '41717deed76615162352533766690ca8e84b9c5170323800409552d65d29d14f1c5bf7ad5f372a42593d84b25721db87cacdd521c8fb6b9db734e677e8020194'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
