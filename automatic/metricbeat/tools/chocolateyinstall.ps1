$ErrorActionPreference = 'Stop';

$packageName = 'metricbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.13.1-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats metricbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '7b6b9d283e243c4958ce45645043c5607f5dc51cae81fd1b867642f31e62a562d5e77a2b9d80f1b218e1b8111174d8cc7c3b65941942ac802485a7730436271f'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
