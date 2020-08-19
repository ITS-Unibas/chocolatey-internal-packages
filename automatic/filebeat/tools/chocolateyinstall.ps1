$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.9.0-windows-x86_64.msi'

$folder = if (Get-ProcessorBits 64) { [io.path]::GetFileNameWithoutExtension($url64) } else { [io.path]::GetFileNameWithoutExtension($url) }

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url64
  url64bit       = $url64
  checksum64     = '38162f0d1d7c50a5d89f82c9524e553d06c39808c5b114cf3507e9e2e6d596d26a8ac71e9e03aee22a59c1c7579770005e741f4703717e1b7935c06928e7e878'
  checksumType64 = 'sha512'
  checksum       = $checksum
  checksumType   = $checksumType64
  specificFolder = $folder
}

Install-ChocolateyPackage @packageArgs
