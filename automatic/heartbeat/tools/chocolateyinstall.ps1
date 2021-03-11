$ErrorActionPreference = 'Stop';

$packageName = 'heartbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.11.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats heartbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'f3670bfef34383cf9c3bcb103f1cf5445da6d463b07d1ea287cccb4bfa4b0cb6a2ea24b1e0f9aed4ca1c0dc06f464da27b00d0c0ed0ae9f9d34d1515a9d2c763'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
