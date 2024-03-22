$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/115.9.1esr/win64/en-US/Firefox%20Setup%20115.9.1esr.msi'
  checksum      = '83b38dd2164f846fc477cdaf9226d3ededc0e3f441de8b38805164b0ce546af28089c186fad87a6f310658bfab916baeccea06d55ea9b79e3797fb9aeb2a147b'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
