$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/47eb3e65-cc77-42eb-a5c5-75620f6cfdfd/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5B9CC54A7BB40D1855484ECBBD9763A55155D82470E13294948A09A0A2121229'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
