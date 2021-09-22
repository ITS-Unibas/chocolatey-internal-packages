$ErrorActionPreference = 'Stop';

$packageName = 'packetbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-7.15.0-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats packetbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'a8d4bd3da29c115793989c821bfd93f5fdbe2cf2a29e09ea281641def143bf5a6371557b27e766735dd4387e4d72168ae7f197e0f2691bc91ac77358e33477f5'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
