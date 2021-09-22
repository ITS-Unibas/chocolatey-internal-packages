$ErrorActionPreference = 'Stop';

$packageName = 'winlogbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.15.0-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats winlogbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'ecb7c993f0f0396382ce9a12d16ea5f692f2871f592f541b944a26665017a7c4a888bb66a66fd6267ce9d23857fef8b038d3ff64768a23925df6c5e24e2f6914'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
