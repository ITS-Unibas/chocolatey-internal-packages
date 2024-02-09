$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/27140695-6d81-49af-a1f8-a388751f9eb3/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '85D49E19D40B5F4C3D61C4C436D7EFF6EFC05378CBACEDAD48DD43CC0266D5B6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
