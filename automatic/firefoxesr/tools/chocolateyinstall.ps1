$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/68.7.0esr/win64/en-US/Firefox%20Setup%2068.7.0esr.exe'
  checksum      = '951481d9cab951e508d0ca13f4bf6a89fc06ff8598124e5b7195487d1df6f6b99f4ddc18d6e766409430b05fc2900b53cb218702196056147097db8d1cb129af'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
