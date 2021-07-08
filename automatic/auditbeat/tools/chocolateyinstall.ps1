$ErrorActionPreference = 'Stop';

$packageName = 'auditbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-7.13.3-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats auditbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '6886b460cc10393d1f5604051b5243aaca48666f0886b2b4331011737efcb38a567515e2fe8f872d1f70470bfbf473813bbbd69da8ebcdcb2564a571fd941add'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
