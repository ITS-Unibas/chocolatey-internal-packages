$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'http://dl.delivery.mp.microsoft.com/filestreamingservice/files/36d8a910-0311-40a1-82f5-68f003f95abb/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'DB0FAA2D2547FE6C06D09DE131A440B1097B94A2B44F3078750924D45E0B8836'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
