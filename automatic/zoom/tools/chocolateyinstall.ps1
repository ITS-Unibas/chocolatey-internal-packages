$ErrorActionPreference = 'Stop';
$checksum = '95479d9358760ea88fa347a65d635760a67f0ebc2625750bc9eed35a8c229b48'
$checksum64 = '8e81e0d7dc401880c4cdfd14db8bed51308608b7aa67fa1e2ca31ccaa71cad93'

$url = 'https://cdn.zoom.us/prod/6.6.11.23272/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/7.2.5.51704/x64/ZoomInstallerFull.msi'

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
