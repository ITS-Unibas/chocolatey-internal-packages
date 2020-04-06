$ErrorActionPreference = 'Stop';

$packageName = 'filebeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = ''

$folder = if (Get-ProcessorBits 64) { [io.path]::GetFileNameWithoutExtension($url64) } else { [io.path]::GetFileNameWithoutExtension($url) }

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url64
  url64bit       = $url64
  checksum64     = ''
  checksumType64 = 'sha512'
  checksum       = $checksum
  checksumType   = $checksumType64
  specificFolder = $folder
}

Install-ChocolateyPackage @packageArgs
