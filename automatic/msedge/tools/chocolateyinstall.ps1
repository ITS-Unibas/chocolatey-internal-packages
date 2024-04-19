$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/88fae2d1-d5f0-4b3a-9e02-65b2e391cd49/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'EE3E7D93DADC80D111DBFB4D85A7FA1AEC0BE641AF7176CC3D11F5F0231A4AFF'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
