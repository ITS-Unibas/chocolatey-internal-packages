$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.5.0esr/win64/en-US/Firefox%20Setup%2078.5.0esr.msi'
  checksum      = 'f79eba7af46364f9d7c8984cea4bbdb392448bdb5ccdb607aa7caaf4deef82692ff3a35c8fa9e6b269be5f5cf763921a0e17105fdca063f536d9deda5b322836'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
