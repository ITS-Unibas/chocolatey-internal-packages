$ErrorActionPreference = 'Stop';
$checksum = '52fa8a7d3f68cc902b8dbd34e71b01b733e38e33ed65a2b0ba8cfa8f9c19181b'
$checksum64 = '2c729b007ef29c2bb26943a3263d46f1e3b4787c567120ff282341937bbad9b3'

$url = 'https://cdn.zoom.us/prod/5.15.3.18551/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.15.3.18551/x64/ZoomInstallerFull.msi'

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
