$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a5eb6795-8004-4a7b-9214-44116ebed383/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = 'E5D585C3228A872D97BAD4A7C95D21CB7E841E726656EC8620D3E3CF135B091F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
