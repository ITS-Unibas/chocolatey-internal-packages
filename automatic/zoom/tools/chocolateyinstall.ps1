$ErrorActionPreference = 'Stop';
$checksum = 'e5448484226751394fa356ec7036703d9f97416edb9367337e4c5f2046be4f3f'
$checksum64 = '7efa2706ad420733843684d1f6f7e1df23c6af0e802b11ef88a5c3be189cea50'

$url = 'https://cdn.zoom.us/prod/6.0.10.39647/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.0.10.39647/x64/ZoomInstallerFull.msi'

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
