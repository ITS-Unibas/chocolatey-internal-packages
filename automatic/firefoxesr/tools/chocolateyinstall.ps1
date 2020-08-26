$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.2.0esr/win64/en-US/Firefox%20Setup%2078.2.0esr.msi'
  checksum      = '09ea7b531bd2f986b0f08391538c421a40f392ffc69fa7d52fc6276783abc836b559f5fa3613e61308e7c6a820b721278e47d291812d6305e691518de9b83ce0'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
