$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/eb583337-beb3-4772-a587-ec9c055bb398/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '48229F430BD28D630B18E5D8D9C6651FBD97A9B64995C004EB3C719DC66A5D69'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
