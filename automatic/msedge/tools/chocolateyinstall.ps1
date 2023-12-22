$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/526e409c-5514-4dda-abdb-39df0afe9c9e/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '5D8A03D16D9B300F66506D31F55D489CED4B0138AD22C9E2164C5F084E9009A6'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
