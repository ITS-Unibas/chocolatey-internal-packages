$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.13.0esr/win64/en-US/Firefox%20Setup%20115.13.0esr.msi'
  checksum      = 'ac1322cfec2d0af7dd8a22961aa90bcdfae3dd454d695a75693d8e667435877d5fb88bdd29bceca8bae9d27ae6a88d92c32f96de54fe2ecec99e9501cff6cdfb'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
