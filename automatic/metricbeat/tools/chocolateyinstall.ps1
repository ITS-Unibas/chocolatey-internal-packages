$ErrorActionPreference = 'Stop';

$packageName = 'metricbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.10.1-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats metricbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '6cb30fd9768cd576b30a78437f29119bb3ac02ab1a633d4685accd7cbfa805c6d58136c62cb0fa0f4433465370a748f4c166f25cf3d5eca6260e818ecc323e4e'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
