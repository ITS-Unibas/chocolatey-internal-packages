$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.6.1esr/win64/en-US/Firefox%20Setup%2091.6.1esr.msi'
  checksum      = '6b66bddca89eeaf373954edd620a52325803139f547fb238454c5af645bcafc63e4ff5d1e1e717c209b6541b4243b0634a65e56884c15c9a055730312f2e2298'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
