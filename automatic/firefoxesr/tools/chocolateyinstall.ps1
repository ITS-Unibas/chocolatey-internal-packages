$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/102.10.0esr/win64/en-US/Firefox%20Setup%20102.10.0esr.msi'
  checksum      = '05278dbfb9d6dfef1d20c6379650fb81e260cc640a5b6357f866c108b013287623d544773b3c5da3a972342d38afb46e224aa83a4bce122c033d386276bdef00'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
