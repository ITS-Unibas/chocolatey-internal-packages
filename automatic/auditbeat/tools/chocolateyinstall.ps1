$ErrorActionPreference = 'Stop';

$packageName = 'auditbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-7.13.0-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats auditbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '1fa956c356482eb99518b48c1f570c569c79d153d4160bfa0668e9f40e42b01524611a683a134d35b3da4328de8538b76bc0093d27743a82b4c84ee34528e920'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
