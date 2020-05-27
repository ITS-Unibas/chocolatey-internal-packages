$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/68.8.0esr/win64/en-US/Firefox%20Setup%2068.8.0esr.exe'
  checksum      = ''
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
