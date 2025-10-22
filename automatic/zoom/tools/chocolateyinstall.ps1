$ErrorActionPreference = 'Stop';
$checksum = '125b038abc40c4d9496fd4e25e5e9054ecd8326119942de54ac0805ceb14fbee'
$checksum64 = 'd97cd3fd2322d418cd5fc4c1151134714d4dd17cf2869432d625c6f3d1c9c23e'

$url = 'https://cdn.zoom.us/prod/6.6.5.19369/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.6.5.19369/x64/ZoomInstallerFull.msi'

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
