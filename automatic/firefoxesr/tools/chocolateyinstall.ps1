$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.12.0esr/win64/en-US/Firefox%20Setup%2078.12.0esr.msi'
  checksum      = '358dfceb90644c16669394f735e7ea6206260f2a2de4ab9373b182b6c12237bcb740871366e7daa75a5ba4cf4408c6888619a6df2a9ad0e38c3148a200cc7b9d'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
