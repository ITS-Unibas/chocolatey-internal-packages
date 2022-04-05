$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/91.8.0esr/win64/en-US/Firefox%20Setup%2091.8.0esr.msi'
  checksum      = 'b10105888a5e27ee34313710cc00b70789c685d639177fee228b301f4790a6a14023218f59b52a39986959dfc8709d7fa8d206558e5fa93c95269d4930c99f39'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
