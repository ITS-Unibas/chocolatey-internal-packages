$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.1.0esr/win64/en-US/Firefox%20Setup%2091.1.0esr.msi'
  checksum      = '98e96d264f31b3f2eef2cc277015f49a77e0a23c5e9ff0a2276c92311e1779262b73ea2b2cb7d78138f61849d6cd33a7c67f45690fb0aa84760bd75edaeb694e'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
