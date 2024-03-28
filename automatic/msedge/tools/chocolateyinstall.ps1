$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3ef01dd6-6f42-4950-b8d3-b4c2037d2b71/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E64ECCCA70E4FD69197ECB5EF42BE52FF5E06D99BBC2391781B5AB7552AD976B'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
