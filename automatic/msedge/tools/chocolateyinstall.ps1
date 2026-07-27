$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/1641ca3d-63ab-4dc5-85a8-1d931217907c/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E8F3EEBED93FE98FD60F36749B0CB2D26E31FB8F704EA4700B7C68634FAFC753'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
