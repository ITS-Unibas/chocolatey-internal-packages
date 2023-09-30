$ErrorActionPreference = 'Stop';
$checksum = '8b8cf709f10085f7cec31533ebe3913407eaa01b16d8ec6299571af808478509'
$checksum64 = 'ad9aa21063c138a6fdfe65e5b5ebe5e85594ecac51f0384e1090f831607170f3'

$url = 'https://cdn.zoom.us/prod/5.16.2.22807/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.16.2.22807/x64/ZoomInstallerFull.msi'

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
