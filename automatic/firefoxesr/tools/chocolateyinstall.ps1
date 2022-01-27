$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.5.1esr/win64/en-US/Firefox%20Setup%2091.5.1esr.msi'
  checksum      = '9cccb602301c2c042c110135797779f36725c4b5dc5927e5fefce9253117cb9d67d774e9e8d19cd69e9439170e6ea66b2cfc313bd8222060415d90a714caae0a'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
