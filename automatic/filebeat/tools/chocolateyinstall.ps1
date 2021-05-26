$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.13.0-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats filebeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '937a05c5a3cbf46428eb4f7aa866826046b1295e2c868b86314d7e5a7a3e0f77fb4fde494b62bee350f9fab3bbfc79a7c1b0141ee635f3c58a8902c12f0089ab'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
