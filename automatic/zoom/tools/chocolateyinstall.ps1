$ErrorActionPreference = 'Stop';
$checksum = '73eed54ad0feee0faf62a91de8d6649aad47c0b354db039706d803657a11f68d'
$checksum64 = '8fc7e4f3668bfd3862664963e28430f63d1a8147b67e281daf4f181f1acae1c2'

$url = 'https://cdn.zoom.us/prod/5.16.10.26186/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.16.10.26186/x64/ZoomInstallerFull.msi'

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
