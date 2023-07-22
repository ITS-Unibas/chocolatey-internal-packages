$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fc3022a3-dae9-47ab-a90d-d601080384fe/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'B0316A2524E5237800C519E34792F29A340FDC490DE8D6C2604EC860812EDF47'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
