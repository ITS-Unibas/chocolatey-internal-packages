$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/647073b1-f0bc-4095-bd9e-146018d0a801/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'FD53FF152C9C6638B166F25EBD4A364AE031DCEEE486BD87D3EF41C73B50C1B2'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
