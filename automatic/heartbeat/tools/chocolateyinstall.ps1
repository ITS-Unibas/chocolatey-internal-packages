$ErrorActionPreference = 'Stop';

$packageName = 'heartbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.10.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats heartbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'd2f8b2e8abd5bcccb91f940ab15ac6fc4b213b55c2e087da030894ceccad149b14c90b3534387f19ca4ffd6426e5f3fe512fb7c766f94204e64511bcb1a268a5'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
