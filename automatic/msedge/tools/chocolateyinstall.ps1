$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/eb61c54b-dafa-4f96-b53a-dbe231f74304/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FE7B2716FEDC39B58DB2A35430CCF900931B7FB109B28099AB2BA72BCC74E571'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
