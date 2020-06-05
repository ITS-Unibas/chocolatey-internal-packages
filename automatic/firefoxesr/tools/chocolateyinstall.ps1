$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/68.9.0esr/win64/en-US/Firefox%20Setup%2068.9.0esr.msi'
  checksum      = 'b1046e2949861784901329d3b2b9a93f5f6286fffaef182d352c2a69eb59301a4562a3915ce81a78c79f04bdd6b09842c6c495cdc9049b24ab9fe6f75887e8a1'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
