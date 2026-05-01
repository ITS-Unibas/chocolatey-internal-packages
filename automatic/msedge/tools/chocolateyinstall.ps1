$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/33a7f26a-babe-4cfd-aa52-de77616e2850/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6CA8F057CAEFEB78116E58D96CC0DC2547BC226C3FD23BE48A9D6E452864A40F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
