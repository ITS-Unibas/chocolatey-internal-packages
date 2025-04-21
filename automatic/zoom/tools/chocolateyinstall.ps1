$ErrorActionPreference = 'Stop';
$checksum = '8249083878fc59736be74af39891eef1bcbe8166e8fb17345e140cb74ca03772'
$checksum64 = 'c12146520a99ccbf76ce77ac7f992357fccd66d32ccbf07b17e0cf04865a022b'

$url = 'https://cdn.zoom.us/prod/6.4.6.64360/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.4.6.64360/x64/ZoomInstallerFull.msi'

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
