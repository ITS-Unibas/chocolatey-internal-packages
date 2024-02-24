$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/c01d3a8b-5c08-48f8-bd28-729801a0e57e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DD1035B788493D4ECE3E036CE14D36232F0E82FF810878EECDF56C7A44E536A6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
