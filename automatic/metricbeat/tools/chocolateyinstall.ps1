$ErrorActionPreference = 'Stop';

$packageName = 'metricbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.15.1-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats metricbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '8edd90a11640efad7a93a35993ad630115a54a06e2f33bca48321c8fbe761e377b9655f2365a8f1e9e9baff447dad02b108890659a53f57de29897f678e2b4cd'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
