$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/418ef12d-4ae7-4174-af17-ed38a5c6a257/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '35DFE4DEAEEFF95C5F1ED20C0D404BA989E3CBEC04243651CD21007073AE29C3'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
