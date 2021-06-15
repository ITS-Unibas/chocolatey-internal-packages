$ErrorActionPreference = 'Stop';

$packageName = 'metricbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.13.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats metricbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '5ad48e63ae8b4a69867f5f38ac81376f25fddb3f0a335c3315581a922b49174d9610faa00521e27966fe998a8a5d69f637ed0b96fa05d460275b28a2b52ead5d'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
