$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/cce9b411-41be-4930-8d22-5776659a7761/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '4640E05338B939C738E133776D77E911C28C90EA602CBCB30ECC93F428792DAF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
