$ErrorActionPreference = 'Stop';
$checksum = '0261f85991fd24406d7e29d3fcb5a7330b41b94e8966659dbf332e7b27a3faea'
$checksum64 = '992f262427c65205708e637ea233be6e7a0e9b9d04d895fd52f4cfd0b4adb7b1'

$url = 'https://cdn.zoom.us/prod/5.16.0.22201/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.16.0.22201/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  url64          = $url64
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
