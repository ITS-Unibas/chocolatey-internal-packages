$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/672dd164-4c25-42a8-b3d3-d7274d6c3d5c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '346748BDE5C6CA71C15C7A800806C7899161B6E903C6B8AB069AFCDA38C5F41E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
