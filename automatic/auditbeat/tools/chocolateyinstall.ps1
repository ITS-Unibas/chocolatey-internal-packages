$ErrorActionPreference = 'Stop';

$packageName = 'auditbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-7.14.0-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats auditbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '5fe470e0ab6fd1b97b714796d361407566f1fa22ea0f0b3859622e8d8fddec68784cdf648cf305a3687b6cbcfeb008199000364506df5de6c1729237610d9658'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
