$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats filebeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'e1387d1d92bf2119b51845ec4e93843d9ba40cd4d5642c68f48c072a92977303075fe56765b5b2745c2b3a59d23569662fc507bda0d2c66a789472d83de34c66'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
