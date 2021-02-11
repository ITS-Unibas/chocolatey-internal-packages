$ErrorActionPreference = 'Stop';

$packageName = 'heartbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.11.0-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats heartbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '6f202d2e85c194e248db038245f78031d7bc279a8a07db998cfce49b13dfd77a6564ff07d06f4a893aa4963fee6e234123dd16c9925a8b8bc7d33b5dcce5761d'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
