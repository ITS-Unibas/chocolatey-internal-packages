$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.10.0esr/win64/en-US/Firefox%20Setup%20115.10.0esr.msi'
  checksum      = '4331b92645b44dffcf44fc557894e77e9babee50e70c8759e0a702c4514787fc8a75753c89681c5f74ce9638ebf13765912314d04234ed9878d91dd200169c62'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
