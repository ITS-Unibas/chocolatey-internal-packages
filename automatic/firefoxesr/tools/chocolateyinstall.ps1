$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.7.1esr/win64/en-US/Firefox%20Setup%2091.7.1esr.msi'
  checksum      = 'bda39f7001395242e72301021455dc5ebc7aa2f4990f8798e748bb7d7bad8bcae30eb756fd618c645ffe83ca613e08e551c320b008418d84b6ae281f7afba80e'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
