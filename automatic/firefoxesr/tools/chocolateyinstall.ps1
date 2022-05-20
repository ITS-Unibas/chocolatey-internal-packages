$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.9.1esr/win64/en-US/Firefox%20Setup%2091.9.1esr.msi'
  checksum      = '38906725cef4e6e5fbfc32f2b3ff84c55f8d97ced2c00d477dae4cbd868eab67a100bd979661ccc48d87457391071751f241318a1745cf5f14630c55cf9bdfd7'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
