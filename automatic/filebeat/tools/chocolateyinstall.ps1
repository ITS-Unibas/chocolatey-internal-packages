$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.9.2-windows-x86_64.msi'

$folder = if (Get-ProcessorBits 64) { [io.path]::GetFileNameWithoutExtension($url64) } else { [io.path]::GetFileNameWithoutExtension($url) }

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url64
  url64bit       = $url64
  checksum64     = '36729cf2ff00f2cd32f5d8519db766a82c820a1f82ef63fd20016016e5bebfc2781d949f89a848a4d46ffb69e4a3b220fb3678c561e87aedf4c7da2dbdf11010'
  checksumType64 = 'sha512'
  checksum       = $checksum
  checksumType   = $checksumType64
  specificFolder = $folder
}

Install-ChocolateyPackage @packageArgs
