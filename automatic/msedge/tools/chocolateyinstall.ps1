$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7b4e86db-a89d-4f34-9e12-f218b875b303/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5FC512514800E9503856036795879F86DB4E797148C3589B794884BB59718A1D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
