$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.12.0esr/win64/en-US/Firefox%20Setup%20102.12.0esr.msi'
  checksum      = '45c65e986b3b198ef7c7b364622747324fbd9d1a8ae2e641598b904095438cd851640de8359afdb0dbfc4c61d6b0836d7b7675c7cd491b01f1e4653c626ec854'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
