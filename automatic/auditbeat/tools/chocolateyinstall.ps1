$ErrorActionPreference = 'Stop';

$packageName = 'auditbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-7.11.0-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats auditbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '9d0d0a59cb1dc2d92c6c231bb787d3fd0c3d7ad2908a572ac33dac7c279adcabd7e67cfbdcae6cb08838b485714e035c1d80230d6cd6c6033f3c5e7d75ecd625'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
