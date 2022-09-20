$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.3.0esr/win64/en-US/Firefox%20Setup%20102.3.0esr.msi'
  checksum      = 'bccc3717f15ba6bdd5f452f135e8da6e701979d6196c57c9da3d09ff5088f1c7795c07006e50daedf2a74ea8ab6d2e8beff21b58f7e85243da2b3589edde346e'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
