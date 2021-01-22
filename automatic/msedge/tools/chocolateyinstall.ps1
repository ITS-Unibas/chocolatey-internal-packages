$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b62ba0b6-7ab7-46c9-9023-5a9ae73b4789/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '9D7C0B067B65CBF90D803C515E37B1D95CB6784555BADA09C86CBFE60C418F79'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
