$ErrorActionPreference = 'Stop';
$checksum = '0bc7d69dd6eea0ca55267b5c83561f54f7aaae657a4bbb06ed9d81b3270e589a'
$checksum64 = '2f8603cf8125e19904498cb945cd54b97205b74411cfaff62efdceaa8a8898c3'

$url = 'https://cdn.zoom.us/prod/6.1.6.43767/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.1.6.43767/x64/ZoomInstallerFull.msi'

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
