$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/3d42c5c0-a1e1-4f90-96ba-967eacd5870a/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '69C0F1883AF05AADECC075FE592D3D3663F042AF48D5A57265DDE948BB5C7151'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
