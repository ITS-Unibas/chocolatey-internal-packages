$ErrorActionPreference = 'Stop';
$checksum = '57e336916124507c1699403f23e1c57561f1210c2accb9921d095aa5f13d99ac'
$checksum64 = 'f4d0fc23efb3670fad9227488eb33942fee9bb8a7aa3e1e41209944cfda2db8d'

$url = 'https://cdn.zoom.us/prod/6.4.1.62504/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.4.1.62504/x64/ZoomInstallerFull.msi'

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
