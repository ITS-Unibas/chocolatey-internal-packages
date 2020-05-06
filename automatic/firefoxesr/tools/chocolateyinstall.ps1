$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/68.8.0esr/win64/en-US/Firefox%20Setup%2068.8.0esr.exe'
  checksum      = '7fb928bb2da4397595c1dc520b41831ae8d92954ff210f7f5d5b148b43bf025e787e56276292cf4d1ec1c4bac9100bff0fcc5ef794cae3653cc89c4fa8e4e94a'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
