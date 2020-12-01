$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/906e3fb0-eb48-49ff-bc91-cacef2a2690f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0C92503F6B3335F3A12A3990AEFF3E87298EDA749CB379AB6B93E2524C62A445'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
