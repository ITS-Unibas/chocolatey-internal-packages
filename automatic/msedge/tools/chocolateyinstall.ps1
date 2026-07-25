$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7987dc1e-4d7c-474e-8f4a-0f66b2895b58/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'CE3C976D8E624756F845F0AD1FC80E31E6099DB56A19FA8CE8341AFE44B325B1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
