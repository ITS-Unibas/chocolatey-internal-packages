$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.14.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats filebeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '64c0720558087ba20638399e8a0c8fb0448bb73fd5bf113ffa050d51d883f14e4617afb8eae3a72d9207f70afa4b9df4a839a1fdb026fe4f121960c2e996973e'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/quiet /norestart'
}

Install-ChocolateyPackage @packageArgs
