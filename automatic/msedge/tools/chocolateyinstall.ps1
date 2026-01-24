$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2e48a591-04a7-4dd6-8db5-23c6190e5058/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7AC3AC23936DD4025D4D9CA56A482232507371CA0DE8E561ADC3BB598AE9D606'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
