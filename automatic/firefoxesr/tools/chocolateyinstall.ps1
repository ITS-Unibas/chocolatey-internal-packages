$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'EXE'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.0.1esr/win64/en-US/Firefox%20Setup%2078.0.1esr.msi'
  checksum      = 'f490435d11608d00856be63dc5f0f6c62d37146a5bf4242cdd468d00ba0015126227db8fb7b184e73fb6f1f70b196ec7d8eab9e3238722134d8519c520003bf2'
  checksumType  = 'sha512'
  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
