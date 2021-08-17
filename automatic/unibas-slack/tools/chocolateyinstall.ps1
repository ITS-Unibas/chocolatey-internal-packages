$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://downloads.slack-edge.com/releases/windows/4.19.0/prod/ia32/slack-standalone-4.19.0.0.msi'
$checksum32 = 'FFFA5269DF5CC5C3C7B8C16F0CF2CC07DD9A471A8AE4CD93372821F6306FB349'
$checksumType32 = 'sha256'
$url64 = 'https://downloads.slack-edge.com/releases/windows/4.19.0/prod/x64/slack-standalone-4.19.0.0.msi'
$checksum64 = 'DC3D22E4A698D99608D64B1EE4B3F24CF270937149580FFC2DE6DAC5E6C42E61'
$checksumType64 = 'sha256'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $url32
  checksum       = $checksum32
  checksumType   = $checksumType32
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64
  softwareName   = 'Slack*'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
