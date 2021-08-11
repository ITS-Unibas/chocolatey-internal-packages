$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.13.0esr/win64/en-US/Firefox%20Setup%2078.13.0esr.msi'
  checksum      = 'd80cf751607dbf150946d5a6ca6d96c0448076f6de80dd09b8b09d85f5c3ef0123c4a3be153ba0a602aedf9957aa8a6ae8dff7700306c2c90b0897aba900d3c8'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
