$ErrorActionPreference = 'Stop';


$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName   = 'firefoxesr'
  softwareName  = 'Mozilla Firefox*'
  fileType      = 'MSI'
  unzipLocation = $toolsDir
  url           = 'https://ftp.mozilla.org/pub/firefox/releases/78.7.0esr/win64/en-US/Firefox%20Setup%2078.7.0esr.msi'
  checksum      = '038a7714f1dd0fdb94cee935a41546178eae29bd2d5acdfe89a4116877b06973f178c31cf67a59f005a10a3bc568ec063d9941024dd4c39e99dc0a57ee53e8dc'
  checksumType  = 'sha512'
  silentArgs    = '/quiet /norestart'
  validExitCodes = @(0, 3010)
}

Install-ChocolateyPackage @packageArgs
