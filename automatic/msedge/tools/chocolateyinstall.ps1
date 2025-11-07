$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8eb47a3e-c4ea-4a6c-aee7-a8ac6e20d71f/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E3D44068B20F64251F2285ED55AD66A61051F1D5718C2718396D0D2981A3F97E'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
