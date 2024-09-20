$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/7fdc66b2-a474-4e32-9155-378200bf93f3/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '09C3E1D74A2CEE2D96D61CFD7CD124FA451B00B22E3A1AB62382727022EC81A6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
