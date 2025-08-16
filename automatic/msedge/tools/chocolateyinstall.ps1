$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/deb00790-27f9-49b5-855c-a43539e62cf1/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '504559443F67FD930B11E8BE0C801C4B9F483BEAC2A01BCAF6F16DA0F2041A35'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
