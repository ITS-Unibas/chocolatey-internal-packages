$ErrorActionPreference = 'Stop';
$checksum = '4a80b6f62cc04153f7dc433fb40b942a2394db84127ce13c8f583cae250867f4'
$checksum64 = '2e4674f4b45d0848899fd8be27943d102c1fb7b823f3691a4fa648fcc27ed1e4'

$url = 'https://cdn.zoom.us/prod/5.14.8.16213/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.14.8.16213/x64/ZoomInstallerFull.msi'

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
