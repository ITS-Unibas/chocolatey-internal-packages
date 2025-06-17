$ErrorActionPreference = 'Stop';
$checksum = '360040b6bb4dee6d4337f7102f0d52be09c34b37b4f21d9d4b4dc7e803bb541c'
$checksum64 = 'f26805533e25ad02837ec36a6b7ffd19209691a89957a92c0ddb8e0a2440de60'

$url = 'https://cdn.zoom.us/prod/6.5.0.6118/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.5.0.6118/x64/ZoomInstallerFull.msi'

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
