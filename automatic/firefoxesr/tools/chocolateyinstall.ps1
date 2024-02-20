$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.8.0esr/win64/en-US/Firefox%20Setup%20115.8.0esr.msi'
  checksum      = '597a90f12eb498c6a806162fe7f72a5bbf8ef2b5032200d1aac95a222f05f967a18fea305ab11d83690d8868178842bfd99dfdbad456966fca9c48990cd5377c'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
