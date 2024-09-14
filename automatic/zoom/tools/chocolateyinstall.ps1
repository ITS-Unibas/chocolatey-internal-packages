$ErrorActionPreference = 'Stop';
$checksum = 'dd068642b85b4305c4866959f3ac2a05012ddf3ed51d62c90c7a44baa017b467'
$checksum64 = '69f8bdaedc342f653e36e1fed3d6be966b70a84e2aef043b5777f14b80a28e41'

$url = 'https://cdn.zoom.us/prod/6.2.0.46690/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.0.46690/x64/ZoomInstallerFull.msi'

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
