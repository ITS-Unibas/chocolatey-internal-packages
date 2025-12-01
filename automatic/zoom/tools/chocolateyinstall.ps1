$ErrorActionPreference = 'Stop';
$checksum = '95479d9358760ea88fa347a65d635760a67f0ebc2625750bc9eed35a8c229b48'
$checksum64 = '5822dd53a5aea36e9b994ded5385bb9e2d9d40bf162d657ce7103cc1f7db957d'

$url = 'https://cdn.zoom.us/prod/6.6.11.23272/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.6.11.23272/x64/ZoomInstallerFull.msi'

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
