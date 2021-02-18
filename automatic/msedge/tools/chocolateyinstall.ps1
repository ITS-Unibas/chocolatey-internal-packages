$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/8c9e37f5-3d6e-4e3f-b369-31df85ac1d48/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '2AAE21C3EFE0ED33994385B499A975CBA7490D169A76BC341EA8C220D0F6866A'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
