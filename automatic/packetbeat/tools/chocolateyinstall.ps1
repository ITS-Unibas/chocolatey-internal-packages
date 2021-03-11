$ErrorActionPreference = 'Stop';

$packageName = 'packetbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-7.11.2-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats packetbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'c12ef547f32b93a1ae7c102a00ef4e5be8355dbcebf044ddd9795a77b72e5cb50689fbbcea319bfb51c4f15d972aaad6ec9dfa141ff07f056dbf373e64c612b5'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
