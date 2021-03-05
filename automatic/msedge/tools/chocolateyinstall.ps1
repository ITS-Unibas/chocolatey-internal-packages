$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a1962fe3-4d73-47dc-b7d8-96395fde5079/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'CDA1A49BAEC22D2FD4ED932F2D80F878648CFF5E19AC139E2840C5F52DEAC750'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
