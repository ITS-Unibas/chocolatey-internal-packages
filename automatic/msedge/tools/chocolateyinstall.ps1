$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e761727c-958f-4cd6-8861-4e070ea7a6a8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '41285806F9894471973F33E61B6AA0B844474C39F7FE30063185301FED1D024B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
