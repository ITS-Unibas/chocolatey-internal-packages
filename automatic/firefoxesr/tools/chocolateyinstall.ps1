$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.10.0esr/win64/en-US/Firefox%20Setup%2091.10.0esr.msi'
  checksum      = '802adef2eff561da574cf0a1f1930becea8b51cadbc893c5147560a9e15fa587ea6277a48969639da3f5024a7f497f403d7833315d15d014c6a473b545a2ee00'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
