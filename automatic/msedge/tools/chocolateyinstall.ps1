$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/d3cee91f-3d6d-4ee5-b319-751f45bb0796/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'F2CA639518CA0EF4EF4A66F5EB22E2296DAA42BAA8D6ACE0A4BCAB390E57FBC0'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
