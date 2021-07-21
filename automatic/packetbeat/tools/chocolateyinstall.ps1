$ErrorActionPreference = 'Stop';

$packageName = 'packetbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-7.13.4-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats packetbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '98a7a094b3bb9777a3939b19f6311f430aeaca3a13c15f30c254e0cf4906a8817e9eeaf204e72f53c8c8039dd9b04ed4e9d464fb13f34a151df2e2ada39bd58b'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
