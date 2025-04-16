$ErrorActionPreference = 'Stop';
$checksum = 'f9b336509379e86f760916d749572908858e28a8800323d24aa925850e89aeeb'
$checksum64 = '75135fd5bab00a64584ec34655743b9123a654a311cad9121e57b3b1651a2a8a'

$url = 'https://cdn.zoom.us/prod/6.4.5.64357/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.4.5.64357/x64/ZoomInstallerFull.msi'

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
