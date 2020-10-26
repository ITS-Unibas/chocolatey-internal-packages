$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'unibas-visioviewer2016'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = ''
  silentArgs     = '/quiet /passive /norestart'
  validExitCodes = @(0, 1638, 3010)
  softwareName   = 'Microsoft Visio Viewer'
  checksum       = ''
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
