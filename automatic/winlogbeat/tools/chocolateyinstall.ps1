$ErrorActionPreference = 'Stop';

$packageName = 'winlogbeat'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.10.1-windows-x86_64.msi'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = "Beats winlogbeat"
  fileType       = 'msi'
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = 'dec3e718f44df18f292adf0ac77233d931691bc9c7c0d867048173f351ec933582dc6bf2271d1d76533bb9f7f5829faad118fa26620b846b87ee49cd65eba770'
  checksumType64 = 'sha512'
  checksumType   = $checksumType64
  silentArgs     = '/qn /norestart'
}

Install-ChocolateyPackage @packageArgs
