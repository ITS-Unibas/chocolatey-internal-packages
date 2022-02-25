$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/e43fb5c1-9521-485e-ac9f-44a06ee99b08/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '84EDEBCB60F360E6FB8CF524E20F540F4A71DBC1D8E0C09B0224D9FF21C3512F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
