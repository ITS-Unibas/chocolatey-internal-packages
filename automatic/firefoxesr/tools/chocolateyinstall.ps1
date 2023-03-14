$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.9.0esr/win64/en-US/Firefox%20Setup%20102.9.0esr.msi'
  checksum      = '889a836d7767e664c2975ace00c338900d2545f2c4bec84a363799a8b1d3ee569582c6d2f940755732be36112d36adf66e5399edf669eedd85ea1c7d6615367e'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
