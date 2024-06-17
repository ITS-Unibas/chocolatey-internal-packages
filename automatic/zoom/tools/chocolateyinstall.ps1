$ErrorActionPreference = 'Stop';
$checksum = '116adc76e21e80c7e596f23c478e8906ea0f58290003c9b5af136ca36fbb77e6'
$checksum64 = '5c642dbbe803be4ce6660d89e059285cc6284249e1842c1f516a369503256bcb'

$url = 'https://cdn.zoom.us/prod/6.1.0.41135/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.1.0.41135/x64/ZoomInstallerFull.msi'

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
