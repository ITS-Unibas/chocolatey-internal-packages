$ErrorActionPreference = 'Stop';

$packageName = 'auditbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-7.11.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats auditbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'ce54538afaa8651e7aaf3094f84b90a4ecccef47786b5def913929ae65c4a4d1894ecd496470df1053fa04c6923549fd5e6bf843ab0a9a1b88aea805615af13f'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
