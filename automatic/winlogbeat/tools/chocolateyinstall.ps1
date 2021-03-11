$ErrorActionPreference = 'Stop';

$packageName = 'winlogbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.11.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats winlogbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '30ccc2be4df179eeb12db94a1e134ffc804c58fc1be3b004e5de0365b0e60ace86f5f54c837c47f3b7d4b6abce92957c37ff41d19e5bdc10bb29e3fe3fa782c9'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
