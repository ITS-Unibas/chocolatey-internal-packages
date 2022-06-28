$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.11.0esr/win64/en-US/Firefox%20Setup%2091.11.0esr.msi'
  checksum      = 'b7976872751ba8c75dc115443624eab4a459d970bd1872ad8e88b93f712b42b3a50f314f487a53cda1ab45cad29e43f3bbeafd98056f3bc8eec005d5ff2fccb0'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
