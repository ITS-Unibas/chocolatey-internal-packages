$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/099b3f39-a299-478b-9987-fe1e1f96803c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '7EE9F9A6E2422BBB2FB305B9D2BF52DFB6BE91F15336601300D5F43F0E59701F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
