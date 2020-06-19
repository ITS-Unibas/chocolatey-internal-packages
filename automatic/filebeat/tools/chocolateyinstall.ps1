$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.8.0-windows-x86_64.msi'

$folder = if (Get-ProcessorBits 64) { [io.path]::GetFileNameWithoutExtension($url64) } else { [io.path]::GetFileNameWithoutExtension($url) }

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url64
  url64bit       = $url64
  checksum64     = 'c00680d145e39ff0b4e12a0540776ed8c78115440792a4736036e77af7c8e90bdd9efc410b6fae7581242010c90797f91abb3754e8eb6aca305c2f542d66f528'
  checksumType64 = 'sha512'
  checksum       = $checksum
  checksumType   = $checksumType64
  specificFolder = $folder
}

Install-ChocolateyPackage @packageArgs
