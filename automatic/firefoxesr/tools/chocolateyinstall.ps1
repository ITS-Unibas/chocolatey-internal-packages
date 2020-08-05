$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.1.0esr/win64/en-US/Firefox%20Setup%2078.1.0esr.msi'
  checksum      = 'a68012a0adbdd917512f2f7cee60880a7325a6fc566033509b862828200ed08c9a63c34edfb4eb4feba535c122862a803f14458dd18a2dcf0bd5f78498f14eba'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
