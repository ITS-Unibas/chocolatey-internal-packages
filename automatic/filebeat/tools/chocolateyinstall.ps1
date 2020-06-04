$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.7.1-windows-x86_64.msi'

$folder = if (Get-ProcessorBits 64) { [io.path]::GetFileNameWithoutExtension($url64) } else { [io.path]::GetFileNameWithoutExtension($url) }

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url64
  url64bit       = $url64
  checksum64     = '002a8bb0b862be5505fa1085ade09360cee4a7fcaec074569196179aa7a48eb80c507a9d6d8b449ba1ea72797f8714225a05b597c55198eb9b1c5f32532e8e0c'
  checksumType64 = 'sha512'
  checksum       = $checksum
  checksumType   = $checksumType64
  specificFolder = $folder
}

Install-ChocolateyPackage @packageArgs
