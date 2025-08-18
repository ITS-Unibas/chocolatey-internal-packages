$ErrorActionPreference = 'Stop';
$checksum = '1e8b621980741b31d6fb626e75effc23fa437698607b235c685a3c1a4ebb8d99'
$checksum64 = 'bdb616ce7e2ccb6c7cded6ef72931c19b444a05d6882bd13f763e75f8fa0c9a0'

$url = 'https://cdn.zoom.us/prod/6.5.10.12704/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.10.12704/x64/ZoomInstallerFull.msi'

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
