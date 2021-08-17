$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.0.1esr/win64/en-US/Firefox%20Setup%2091.0.1esr.msi'
  checksum      = '71384e6a416f2df880f49cb121f9ed5b3b697950190d0c6585a923a97f5201b59bdb0ae6b1a59555f1ab17aa7780305bfabf948791085325fe11667089f1f8c1'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
