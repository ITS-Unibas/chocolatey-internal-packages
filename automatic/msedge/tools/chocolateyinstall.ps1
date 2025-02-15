$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/03621605-a301-435a-9b39-49b69e3449b8/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2680E1086B9C22898030EAA8CBEBA310E65056E9AC29A8F01FFD2EA01807D799'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
