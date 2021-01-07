$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.6.1esr/win64/en-US/Firefox%20Setup%2078.6.1esr.msi'
  checksum      = 'ec96062d72bd1126cac772a574d426ab1fd718d904d92647ae1dd023973b44029879f2ec373c92a9017778d338c08867b9f6a04eb13efd756b6cdb23fa6847a2'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
