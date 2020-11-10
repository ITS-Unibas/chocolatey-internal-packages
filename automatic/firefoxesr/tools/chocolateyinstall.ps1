$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.4.1esr/win64/en-US/Firefox%20Setup%2078.4.1esr.msi'
  checksum      = '9a13cdb25d9c506bd3cea07880fb52c64a0a8b45a4a36e75a8605491b3f2630d2cbeb2955b7a1df9a6ee3723ba721d2cf405265efe7b540a409291c83ae54ce3'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
