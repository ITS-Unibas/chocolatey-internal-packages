$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.5.0esr/win64/en-US/Firefox%20Setup%20115.5.0esr.msi'
  checksum      = '64765138cb001331e99416913b6934e9552c611303b00a6b9d53a826070d60f0f17c80ac4ce3f21998488937835c6bccf4712376c38a337789566e35edfc847a'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
