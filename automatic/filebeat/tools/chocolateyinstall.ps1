$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.12.1-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats filebeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '1a9c425f24791e49ff76d81d7a0778c844461f6c9596569d975a41ae5c7eeb9813a4647070065c5679dba6149e75fa5b7d0f1d2820b633edcb75ce00aa4044f1'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
