$ErrorActionPreference = 'Stop';

$packageName = 'unibas-slack'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32          = 'https://downloads.slack-edge.com/releases/windows/4.19.0/prod/ia32/slack-standalone-4.19.0.0.msi'
$checksum32     = ''
$checksumType32 = ''
$url64          = 'https://downloads.slack-edge.com/releases/windows/4.19.0/prod/x64/slack-standalone-4.19.0.0.msi'
$checksum64     = ''
$checksumType64 = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url32
  checksum      = $checksum32
  checksumType  = $checksumType32
  url64bit      = $url64
  checksum64    = $checksum64
  checksumType64= $checksumType64
  softwareName  = 'unibas-slack*'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
