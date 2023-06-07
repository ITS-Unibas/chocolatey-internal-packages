﻿$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://downloads.slack-edge.com/releases/windows/4.32.127/prod/ia32/slack-standalone-4.32.127.0.msi'
$checksum32 = '46cbf09fd90fff6948315f56c40ec4f0d3e673f6827e34f68580d6cc45e7f6c1'
$checksumType32 = 'sha256'
$url64 = 'https://downloads.slack-edge.com/releases/windows/4.32.127/prod/x64/slack-standalone-4.32.127.0.msi'
$checksum64 = '7e159f687e33c429df01f644e214f813cd6b20bcf38d14a9b0d9c62b629c3d6b'
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
