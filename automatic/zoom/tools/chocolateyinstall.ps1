$ErrorActionPreference = 'Stop';
$checksum = '0fe83b7313b644f343c13a188ade909991c958ae2f8bc779edc30be53b161cea'
$checksum64 = '3774f19db358af57e7c653196c17a785f1822137c7ffecf4b8d1e85b8951b7c9'

$url = 'https://cdn.zoom.us/prod/6.2.3.47507/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.3.47507/x64/ZoomInstallerFull.msi'

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
