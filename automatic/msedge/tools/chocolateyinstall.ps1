$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/04705fe5-a0d7-4c0e-9e35-567443bc5d7f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'C3777F4FDBFA6207B2B4885C0E5985C8602805D93F526FE1B0DAEDE4ABF8CD25'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
