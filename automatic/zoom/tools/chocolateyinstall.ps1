$ErrorActionPreference = 'Stop';
$checksum = '47ad56e363ccc09a18bac285252371ba3d9de952d4631bb5a9c70d67c31c7b3e'
$checksum64 = 'b1d720860657b7f15a8511db4ea8b028ca7d48a1178a1b6c2a712f085d7c187d'

$url = 'https://cdn.zoom.us/prod/6.0.3.37634/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.0.3.37634/x64/ZoomInstallerFull.msi'

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
