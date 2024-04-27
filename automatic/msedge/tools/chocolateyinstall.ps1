$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/9fde42df-3c14-465e-ac94-ec3f5f8ffd9b/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'EAAA30551B5B27CA33AEE58F61371053272E2AC0E5CC530A0A3FE97F48F451A2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
