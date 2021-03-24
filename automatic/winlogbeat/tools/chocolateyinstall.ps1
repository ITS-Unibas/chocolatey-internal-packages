$ErrorActionPreference = 'Stop';

$packageName = 'winlogbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.12.0-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats winlogbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '9b73b50ee59fb271f8c9766f237e61ec5930ab234376b619ea79d97629b888375389ed1c6ea1c99df4be5e788357757f421b585ab8fb13d58822290ff7282e0d'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
