$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.6.0esr/win64/en-US/Firefox%20Setup%20115.6.0esr.msi'
  checksum      = 'a6b368cca2a8ec85aba18ff8f6f6b236b170ab0389b3eb1f103779ee741920ea1a6830259b104f6aee29e18efd98f05b391924a48b363cef997ba8aa6968dd58'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
