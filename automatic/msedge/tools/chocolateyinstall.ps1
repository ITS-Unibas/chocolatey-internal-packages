$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/79e64e16-eccf-41f3-b291-14affabf6e98/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E38433E78F265DB153D50F7C61CBD67375A716D5C04D7A44FAE260AF084F0A27'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
