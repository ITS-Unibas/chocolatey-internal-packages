$ErrorActionPreference = 'Stop';

$packageName = 'heartbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.15.1-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats heartbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '528552241442887cad11215f5e3949a98b2bf4b632d5c9fb146da157c4b8ca95ee7abf23395d606e3d77be8080667cf66e2fbf0d4467c2f703f57d89dbd1fb1c'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
