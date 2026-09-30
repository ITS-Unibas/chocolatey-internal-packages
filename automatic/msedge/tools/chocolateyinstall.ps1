$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/6ea91b08-319a-4eb8-94f4-b49214771e12/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B14BF144C6CDC915A34B23E1162B27352F2911E3FC12F1E6006957BCB461076D'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
