$ErrorActionPreference = 'Stop';

$packageName = 'winlogbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.13.4-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats winlogbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'a6dced2f31a3cf9c964b7710f427fceead51be00a35a8866abf1f27f4599e0b85ef55e291e39a173d7df6d6019e6df97dd63c9ded8589aad3078f8d181553471'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
