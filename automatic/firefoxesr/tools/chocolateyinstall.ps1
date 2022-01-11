$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.5.0esr/win64/en-US/Firefox%20Setup%2091.5.0esr.msi'
  checksum      = '680f83ca6a97ef8292e5ae3e00ed963691aac20fc3dbc3b3995a769a146c5aaf496b42417ca5d4a70384b3d8ccbaa23fce468f88bdab54a1b6ab6857a1d6bac8'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
