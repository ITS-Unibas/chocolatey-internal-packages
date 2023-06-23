$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/790eefa8-a230-4090-82a3-ce52edf1a330/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '6BB461D946135B993AA7FBC3DF4306FA9E39054A3CC1A07F2F15B918AD42CBFD'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
