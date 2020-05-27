$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/68.8.0esr/win64/en-US/Firefox%20Setup%2068.8.0esr.exe'
  checksum      = 'b6e598035c524910ba389005443b61de14679fb2a0515be9d8ab41a39205c47f041797b7f52747ab6f554a6f28e12e28b1d9e9a2e03db3484c09f191f9aa96cb'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
