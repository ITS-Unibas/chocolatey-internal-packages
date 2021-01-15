$ErrorActionPreference = 'Stop';

$packageName = 'metricbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.10.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats metricbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'cc2ebcc07d54ccc4cd84faff9cde2a3931e191316c0d7505d34b5391e539991643e9e9ca6abea6cc6afc27e20cf7af94c1d173536f2c7b126c9d6aeffb0d5b4a'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
