$ErrorActionPreference = 'Stop';

$packageName = 'packetbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-7.9.3-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats packetbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '7b0d3270d7bb42a1c47017ff8bf2f0e24e279540e57b41e047924ceded876822364cc75fb2cd0c71e64871257b89e669854bbda54908a3609e689ab2628c05c7'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
