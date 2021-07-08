$ErrorActionPreference = 'Stop';

$packageName = 'heartbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.13.3-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats heartbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '70b5d11618e04fa2aa8bda23085de170dfd6d115ef210edd760131238f243dad46c97617a9e5808bce205320a7fba729a7751b3a878f77b5e416ade446dd126c'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
