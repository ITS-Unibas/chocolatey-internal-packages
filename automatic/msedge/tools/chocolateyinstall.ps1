$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/4023aa94-d449-48fb-bce1-12ffafe056c5/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'D2CBEEEC222F1D093976C891F93ABC32F038561E98BE73D37BEA76A6E6A466EB'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
