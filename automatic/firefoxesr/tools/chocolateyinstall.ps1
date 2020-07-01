$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/68.10.0esr/win64/en-US/Firefox%20Setup%2068.10.0esr.msi'
  checksum      = 'c4d5564807e493cc7c6861d6675e885e225d3c194f4fbbbed08d7545d91afbc5b44376694614cf466bcd88d3b746f9c503e4b5a2e018c4b8a613dc38200c9167'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
