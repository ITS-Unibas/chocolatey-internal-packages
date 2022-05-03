$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.9.0esr/win64/en-US/Firefox%20Setup%2091.9.0esr.msi'
  checksum      = 'e8227ff8c051a7acc7b6742228ec754a4ea6365baab20e2fea48b09ec275e6136560b517832537b5210c745ca76af48a8477d80c72c5e51fee0f398335a3e501'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
