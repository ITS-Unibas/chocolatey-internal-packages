$ErrorActionPreference = 'Stop';
$checksum = 'f92ecce4614211b3fb64be7fa2b25d6d341cb9ddb6599c600889f2a805a02dbe'
$checksum64 = '62e18ac0126514391393cb70903a1067a2e338945f350dd9a69bc25bb7ddd3c8'

$url = 'https://cdn.zoom.us/prod/6.3.1.53598/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.3.1.53598/x64/ZoomInstallerFull.msi'

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
