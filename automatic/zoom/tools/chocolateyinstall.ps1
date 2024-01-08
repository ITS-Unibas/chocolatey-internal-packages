$ErrorActionPreference = 'Stop';
$checksum = '073dd281b22c57a48b09b1646cbf7f3fb9f6553046d2e6a486f9b77328cd405f'
$checksum64 = 'e58d81516c550e61a2941cfce7fefc8f01cdaaa17665ebc44df3e1bf4607d512'

$url = 'https://cdn.zoom.us/prod/5.17.2.29988/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.17.2.29988/x64/ZoomInstallerFull.msi'

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
