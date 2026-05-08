$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1c94fae2-b0f4-4415-bb95-dae4c4c7189d/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'A69CD31857DFBE3FB138E5D5BB5EA0A1BBEB7204926BA17AD36FB0E6E3F50EF0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
