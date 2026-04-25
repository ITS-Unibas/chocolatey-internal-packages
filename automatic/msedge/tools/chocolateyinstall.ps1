$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/2d48f894-08d6-4212-99bc-319200435457/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B1DCC651AC4F168EE658285293119E47C95A79391C5AE560A977D63BF8518EF5'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
