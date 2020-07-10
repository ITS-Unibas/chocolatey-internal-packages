$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.0.2esr/win64/en-US/Firefox%20Setup%2078.0.2esr.msi'
  checksum      = '4e01b48ae8158ed5d7fd6e1a1cc2106337a18b4b6b41c4c7aee7a2f6743b5bdb604712e214373380aeded5427d25941b7d721712883a7929cf4dafccd5d44f0b'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
