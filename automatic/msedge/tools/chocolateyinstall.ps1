$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6b39ffa2-9059-4423-bfe5-20a7e8713247/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '175765B74D3D5AF32578F7C0722AC5348EBF5F4262272E7896AA48886DB0B44A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
