$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e4600c98-19d4-4707-8c4a-32d674a082c5/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '080D8B6B1513D17B265CEEAFAC01AF76D9BC9A07855AFCB5FA68E504F8C8FBB1'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
