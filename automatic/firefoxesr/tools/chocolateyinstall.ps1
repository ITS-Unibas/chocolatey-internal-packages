$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.5.0esr/win64/en-US/Firefox%20Setup%20102.5.0esr.msi'
  checksum      = '3f343b9781444b210d63130eba0eb1e07731a56e0caa925ea031805335eae809e34e404b4fff0ea22bfea8e05a812fbc1d36e2ee5a63798964b7a9ae2204e7e4'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
