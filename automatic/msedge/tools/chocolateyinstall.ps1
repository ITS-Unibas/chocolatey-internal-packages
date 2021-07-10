$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/af1d3dfb-1595-423f-aa3b-d36c5c0fcf36/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '3E11CCEF5765F13A7C670FA027E808D0D2C2E07CDFA6E4343BA2F65584F6555A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
