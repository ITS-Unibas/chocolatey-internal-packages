$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.11.0esr/win64/en-US/Firefox%20Setup%20115.11.0esr.msi'
  checksum      = '93b77edf6640a5914a9d12613a841195cd6e7327adbd0a2b6061981ed043605dcc818fef5c996a421a7b64dfafddac4d791256609adf092caac917febe835e51'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
