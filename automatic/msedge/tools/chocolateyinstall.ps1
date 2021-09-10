$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/b003e707-85e6-456e-9f4f-9e80acf2c1d3/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '0ADD97EBEEA929672A89167073FB0CB2EC3FF84578CC55764F65C754736773CD'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
