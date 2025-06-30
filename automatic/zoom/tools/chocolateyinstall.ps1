$ErrorActionPreference = 'Stop';
$checksum = 'b3b9416786d3fb5c74ef8c6666fd9849e5bedb62445727eecef98d7ca389feea'
$checksum64 = 'bbcf73741feaea00d215080d8cc01e833980cba2678da28346a93bf9ba964dde'

$url = 'https://cdn.zoom.us/prod/6.5.3.7509/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.3.7509/x64/ZoomInstallerFull.msi'

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
