$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.11.1-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats filebeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '752fe8957027b75623466b889813c4e0d2a1fb69836fc9d178e85b7b49dd7f86b35427eb8fda174fabf7a9a020e8385f1d0388ade59c3be9bd12c3ff01cc8ca5'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
