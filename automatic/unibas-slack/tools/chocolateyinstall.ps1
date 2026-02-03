$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://downloads.slack-edge.com/releases/windows/4.33.84/prod/ia32/slack-standalone-4.33.84.0.msi'
$checksum32 = '2dc813f90c9726931556515e4d06226af8dbf43708f3e427c56b924ef74bd66b'
$checksumType32 = 'sha256'
$url64 = 'https://downloads.slack-edge.com/desktop-releases/windows/x64/4.48.86/slack-standalone-4.48.86.0.msi'
$checksum64 = '2320e04fa051b6f4f4297301f32e45b1acc44bcdf5450bdee278f8ed456ee8c2'
$checksumType64 = 'sha256'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $url32
  checksum       = $checksum32
  checksumType   = $checksumType32
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64
  softwareName   = 'Slack*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
