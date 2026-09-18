$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/fac1dc9b-8a85-4c7a-9bf3-2d755ac87b07/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'CA91A142DC401FE8195E1E6F14273F026EAD228900857F97405CE4F1656CD5B8'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
