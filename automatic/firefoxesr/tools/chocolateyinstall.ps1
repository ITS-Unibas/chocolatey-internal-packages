$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.8.0esr/win64/en-US/Firefox%20Setup%2078.8.0esr.msi'
  checksum      = '899626156810083f538f9db861e4a36597e07008edd4eb4636ddb025e20b56598aea743b9a77b82a774066abeb4ee1a5a9866c2a4cab1a595a987ae14116e821'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
