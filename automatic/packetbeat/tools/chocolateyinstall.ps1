$ErrorActionPreference = 'Stop';

$packageName = 'packetbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-7.15.1-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats packetbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '57084c016e4c69e6f1f6e6cc29c4b51d3c0da338b73cfa74844fcbaae29acd4c2075fa8a7b637fc34dbb9aec7340230aaa864d13763544d19109a9f8129768d5'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
