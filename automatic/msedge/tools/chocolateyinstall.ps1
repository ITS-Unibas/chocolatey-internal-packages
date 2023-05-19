$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d9d8b4d4-0136-4c8f-8dfe-4c3ff29b2473/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F0C2B2CD7D506F0D3677367CCBBD2B18EA20A18A1B7D2B78B65BD5738397E7E0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
