$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.2.1esr/win64/en-US/Firefox%20Setup%20115.2.1esr.msi'
  checksum      = 'ae8b86957080ce4a78e1be459c668f46b1d3ee5e6623e481bc95574aef10a3b1d55960777fe81fa69313d11844a7c7655e0807f9644f3b05a19995f9824edd4f'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
