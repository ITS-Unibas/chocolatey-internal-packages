$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'msedge'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/12946913-9fc9-450d-a43e-5eee4a0f6819/MicrosoftEdgeEnterpriseX64.msi'
  silentArgs     = '/quiet /norestart'
  validExitCodes = @(0)
  softwareName   = 'edge*'
  checksum       = '54EEAB6848E54294CA9C5AE62032304BF2F078DBD76EDA8EFD4C05791335C4EC'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
